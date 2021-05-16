# IIS CODE

```C#
/// <summary>
    /// 管理IIS网站
    /// </summary>
    public class IISManager
    {
        private readonly String _hostName = "localhost";

        private readonly DirectoryEntry rootEntry = null;

        public IISManager(String hostName = "")
        {
            _hostName = hostName;
            rootEntry = new DirectoryEntry("IIS://" + _hostName + "/W3SVC");
        }
        public IISManager(String hostName = "", String Username = "", String Password = "")
            : this(hostName)
        {
            _hostName = hostName;
        }

        /// <summary>
        /// 获取本地IIS版本
        /// </summary>
        /// <returns></returns>
        public String GetIISVersion()
        {
            try
            {
                DirectoryEntry entry = new DirectoryEntry("IIS://" + _hostName + "/W3SVC/INFO");
                return entry.Properties["MajorIISVersionNumber"].Value.ToString();
            }
            catch (Exception se)
            {
                //说明一点:IIS5.0中没有(int)entry.Properties["MajorIISVersionNumber"].Value;属性，
                //将抛出异常 证明版本为 5.0
                return String.Empty;
            }
        }

        /// <summary>
        /// 创建虚拟目录网站
        /// </summary>
        /// <param name="webSiteName">网站名称</param>
        /// <param name="physicalPath">物理路径</param>
        /// <param name="domainPort">站点+端口，如192.168.1.23:90</param>
        /// <param name="serverState">WEB启动状态</param>
        /// <returns></returns>
        public void CreateWebSite(String webSiteName, String physicalPath, String domainPort, String serverState)
        {
            // 为新WEB站点查找一个未使用的ID
            int siteID = 1;
            foreach (DirectoryEntry e in rootEntry.Children)
            {
                if (e.SchemaClassName.Equals("IIsWebServer", StringComparison.OrdinalIgnoreCase))
                {
                    int ID = Convert.ToInt32(e.Name);
                    if (ID >= siteID) { siteID = ID + 1; }
                }
            }
            //是否应该创建目录
            System.IO.DirectoryInfo dir = new System.IO.DirectoryInfo(physicalPath);
            if (!dir.Exists) { dir.Create(); }

            // 创建WEB站点
            DirectoryEntry site = (DirectoryEntry)rootEntry.Invoke(State.Create.ToString(), new Object[] { "IIsWebServer", siteID });
            site.Invoke("Put", "ServerComment", webSiteName);
            site.Invoke("Put", "KeyType", "IIsWebServer");
            site.Invoke("Put", "ServerBindings", domainPort + ":");
            site.Invoke("Put", "ServerState", serverState);
            //site.Invoke("Put", "FrontPageWeb", 1);
            //site.Invoke("Put", "DefaultDoc", "Login.html");
            // site.Invoke("Put", "SecureBindings", ":443:");
            //site.Invoke("Put", "ServerAutoStart", 1);
            //site.Invoke("Put", "ServerSize", 1);
            site.Invoke("SetInfo");
            // 创建应用程序虚拟目录
            DirectoryEntry siteVDir = site.Children.Add("Root", "IISWebVirtualDir");
            siteVDir.Properties["Path"][0] = physicalPath;

            //siteVDir.Properties["AppIsolated"][0] = 2;
            //siteVDir.Properties["AccessFlags"][0] = 513;
            //siteVDir.Properties["FrontPageWeb"][0] = 1;
            //siteVDir.Properties["AppRoot"][0] = "LM/W3SVC/" + siteID + "/Root";
            //siteVDir.Properties["AppFriendlyName"][0] = "Root";
            siteVDir.CommitChanges();
            site.CommitChanges();
        }

        public void UpdateIISWebSite(String oldWebSiteName, String webSiteName, String physicalPath,
            String domainPort, String serverState)
        {
            DirectoryEntry childrenEntry = this.DirectoryEntryChildren(oldWebSiteName);
            childrenEntry.Properties["ServerComment"].Value = webSiteName;
            childrenEntry.Properties["ServerState"].Value = serverState;
            childrenEntry.Properties["ServerBindings"].Value = domainPort + ":";
            //更新程序所在目录
            foreach (DirectoryEntry childrenDir in childrenEntry.Children)
            {
                if (childrenDir.SchemaClassName.Equals("IISWebVirtualDir", StringComparison.OrdinalIgnoreCase))
                {
                    childrenDir.Properties["Path"].Value = physicalPath;
                    childrenDir.CommitChanges();
                    childrenEntry.CommitChanges();
                    return;
                }
            }
        }

        #region IISWeb 启动/停止/删除
        public void StartWebSite(String serverComment)
        {
            DirectoryEntry children = this.DirectoryEntryChildren(serverComment);
            if (children != null)
            {
                children.Invoke(State.Start.ToString(), new Object[] { });
            }
        }
        public void StartWebSite(Int32 name)
        {
            this.WebEnable(name, State.Start);
        }
        public void ResetWebSite(String serverComment)
        {
            DirectoryEntry children = this.DirectoryEntryChildren(serverComment);
            if (children != null)
            {
                children.Invoke(State.Reset.ToString(), new Object[] { });
            }
        }
        public void ResetWebSite(Int32 name)
        {
            this.WebEnable(name, State.Reset);
        }
        public void StopWebSite(String serverComment)
        {
            DirectoryEntry children = this.DirectoryEntryChildren(serverComment);
            if (children != null)
            {
                children.Invoke(State.Stop.ToString(), new Object[] { });
            }
        }
        public void StopWebSite(Int32 name)
        {
            this.WebEnable(name, State.Stop);
        }
        /// <summary>
        /// 依据网站名称删除
        /// <param name="serverComment">网站名称:如:Test</param>
        /// </summary>
        public void RemoveIISWebServer(String serverComment)
        {
            DirectoryEntry children = this.DirectoryEntryChildren(serverComment);
            if (children != null)
            {
                //this.st(serverComment); //先停止IIS程序池
                children.DeleteTree();
            }
        }
        /// <summary>
        /// 依据网站名称在IIS中的排列顺序删除
        /// <param name="name">排列顺序:如:Test的</param>
        /// </summary>
        public void RemoveIISWebServer(Int32 name)
        {
            DirectoryEntry siteEntry = new DirectoryEntry("IIS://" + _hostName + "/W3SVC/" + name);
            siteEntry.DeleteTree();
        }

        private void WebEnable(Int32 name, State state)
        {
            DirectoryEntry siteEntry = new DirectoryEntry("IIS://" + _hostName + "/W3SVC/" + name);
            siteEntry.Invoke(state.ToString(), new Object[] { });
        }
        private DirectoryEntry DirectoryEntryChildren(String serverComment)
        {
            foreach (DirectoryEntry entry in rootEntry.Children)
            {
                if (entry.SchemaClassName.Equals("IIsWebServer", StringComparison.OrdinalIgnoreCase))
                {
                    if (entry.Properties["ServerComment"].Value.ToString()
                        .Equals(serverComment, StringComparison.OrdinalIgnoreCase))
                    {
                        return entry;
                    }
                }
            }
            return null;
        }
        #endregion

        #region 注释得到物理路径+程序池
        ///// <summary>
        ///// 得到网站的物理路径
        ///// </summary>
        ///// <param name="rootEntry">网站节点</param>
        ///// <returns></returns>
        //private String GetWebsitePhysicalPath(DirectoryEntry rootEntry)
        //{
        //    return GetDirectoryEntryChildren(rootEntry, "Path");
        //}
        ///// <summary>
        ///// 得到网站的物理路径
        ///// </summary>
        ///// <param name="rootEntry">网站节点</param>
        ///// <returns></returns>
        //private String GetAppPoop(DirectoryEntry rootEntry)
        //{
        //    return GetDirectoryEntryChildren(rootEntry, "AppPoolId");
        //}
        //private String GetDirectoryEntryChildren(DirectoryEntry rootEntry, String properties)
        //{
        //    String propValue = String.Empty;
        //    foreach (DirectoryEntry childEntry in rootEntry.Children)
        //    {
        //        if ((childEntry.SchemaClassName.Equals("IIsWebVirtualDir", StringComparison.OrdinalIgnoreCase))
        //            && (childEntry.Name.Equals("root", StringComparison.OrdinalIgnoreCase)))
        //        {
        //            if (childEntry.Properties[properties].Value != null)
        //            {
        //                propValue = childEntry.Properties[properties].Value.ToString();
        //            }
        //        }
        //    }
        //    return propValue;
        //}
        #endregion

        public bool AnyServerComment(String serverComment)
        {
            List<IISWebManager> list = this.ServerBindings();
            Boolean flag = list.Any<IISWebManager>(w => w.ServerComment.Equals(serverComment, StringComparison.OrdinalIgnoreCase));
            return flag;
        }
        public bool AnyDomainProt(Int32 domainPort)
        {
            List<IISWebManager> list = this.ServerBindings();
            Boolean flag = list.Any<IISWebManager>(w => w.DomainPort == domainPort);
            return flag;
        }
        /// <summary>
        /// 获取站点信息
        /// </summary>
        public List<IISWebManager> ServerBindings()
        {
            List<IISWebManager> iislist = new List<IISWebManager>();
            DirectoryEntry rootChildrenEntry = null;
            IEnumerator enumeratorRoot = null;
            foreach (DirectoryEntry entry in rootEntry.Children)
            {
                if (entry.SchemaClassName.Equals("IIsWebServer", StringComparison.OrdinalIgnoreCase))
                {
                    var props = entry.Properties;

                    // if (props["ServerComment"][0].ToString().Contains("Default")) { continue; }
                    //获取网站绑定的IP，端口，主机头
                    String[] serverBindings = props["ServerBindings"].Value.ToString().Split(':');
                    var physicalPath = "";
                    var appPoolId = "";
                    enumeratorRoot = entry.Children.GetEnumerator();
                    while (enumeratorRoot.MoveNext())
                    {
                        rootChildrenEntry = (DirectoryEntry)enumeratorRoot.Current;
                        appPoolId = rootChildrenEntry.Properties["AppPoolId"].Value.ToString();
                        if (rootChildrenEntry.SchemaClassName.Equals("IIsWebVirtualDir", StringComparison.OrdinalIgnoreCase))
                        {
                            physicalPath = rootChildrenEntry.Properties["Path"].Value.ToString();
                            break;
                        }
                    }

                    iislist.Add(new IISWebManager()
                    {
                        Name = Convert.ToInt32(entry.Name),
                        ServerComment = props["ServerComment"].Value.ToString(),
                        DomainIP = serverBindings[0].ToString(),
                        DomainPort = Convert.ToInt32(serverBindings[1]),
                        ServerState = props["ServerState"][0].ToString(),//运行状态
                        PhysicalPath = physicalPath,
                        AppPoolId = appPoolId
                    });

                    //String EnableDeDoc = props["EnableDefaultDoc"][0].ToString();
                    //String DefaultDoc = props["DefaultDoc"][0].ToString();//默认文档
                    //String MaxConnections = props["MaxConnections"][0].ToString();//iis连接数,-1为不限制
                    //String ConnectionTimeout = props["ConnectionTimeout"][0].ToString();//连接超时时间
                    //String MaxBandwidth = props["MaxBandwidth"][0].ToString();//最大绑定数
                    //String ServerState = props["ServerState"][0].ToString();//运行状态
                    //var ServerComment = (String)Server.Properties["ServerComment"][0];
                    //var AccessRead = (Boolean)Server.Properties["AccessRead"][0];
                    //var AccessScript = (Boolean)Server.Properties["AccessScript"][0];
                    //var DefaultDoc = (String)Server.Properties["DefaultDoc"][0];
                    //var EnableDefaultDoc = (Boolean)Server.Properties["EnableDefaultDoc"][0];
                    //var EnableDirBrowsing = (Boolean)Server.Properties["EnableDirBrowsing"][0];
                    //var Port = Convert.ToInt32(((String)Server.Properties["Serverbindings"][0])
                    //   .Substring(1, ((String)Server.Properties["Serverbindings"][0]).Length - 2));

                    //ieRoot = Root.Children.GetEnumerator();
                    //while (ieRoot.MoveNext())
                    //{
                    //    VirDir = (DirectoryEntry)ieRoot.Current;
                    //    if (VirDir.SchemaClassName != "IIsWebVirtualDir" && VirDir.SchemaClassName != "IIsWebDirectory")
                    //        continue;
                    //    var TName = VirDir.Name;
                    //    var TAccessRead = (Boolean)VirDir.Properties["AccessRead"][0];
                    //    var TAccessScript = (Boolean)VirDir.Properties["AccessScript"][0];
                    //    var TDefaultDoc = (String)VirDir.Properties["DefaultDoc"][0];
                    //    var TEnableDefaultDoc = (Boolean)VirDir.Properties["EnableDefaultDoc"][0];
                    //    if (VirDir.SchemaClassName == "IIsWebVirtualDir")
                    //    {
                    //        var TPath = (String)VirDir.Properties["Path"][0];
                    //    }
                    //    else if (VirDir.SchemaClassName == "IIsWebDirectory")
                    //    {
                    //        var TPath = Root.Properties["Path"][0] + @"\" + VirDir.Name;
                    //    }
                    //}
                    ////取全部的字段
                    //String str = "";
                    //System.DirectoryServices.PropertyCollection props = entry.Properties;
                    //foreach (String name in props.PropertyNames)
                    //{
                    //    foreach (Object o in props[name])
                    //    {
                    //        str += name.ToString() + ":" + o.ToString() + "\n";
                    //    }
                    //}
                }
            }
            return iislist;
        }



        public List<IISAppPoolInfo> GetAppPools()
        {
            List<IISAppPoolInfo> list = new List<IISAppPoolInfo>();
            DirectoryEntry appPoolEntry = new DirectoryEntry(String.Format("IIS://{0}/W3SVC/AppPools", _hostName));
            foreach (DirectoryEntry entry in appPoolEntry.Children)
            {
                var schmeName = entry.Name;
                list.Add(new IISAppPoolInfo()
                {
                    AppPoolName = entry.Name,
                    AppPoolIdentityType = entry.Properties["AppPoolIdentityType"].Value.ToString(),
                    AppPoolCommand = Convert.ToInt32(entry.Properties["AppPoolCommand"].Value),
                    AppPoolState = Convert.ToInt32(entry.Properties["AppPoolState"].Value),
                    ManagedPipelineMode = Convert.ToInt32(entry.Properties["ManagedPipelineMode"].Value),
                    ManagedRuntimeVersion = entry.Properties["ManagedRuntimeVersion"].Value.ToString()
                });
            }
            return list;
        }
        public Boolean DeleteAppPool(String appPool)
        {
            Boolean flag = false;
            if (String.IsNullOrEmpty(appPool)) return flag;
            DirectoryEntry de = new DirectoryEntry(String.Format("IIS://{0}/W3SVC/AppPools", _hostName));
            foreach (DirectoryEntry entry in de.Children)
            {
                if (entry.Name.Equals(appPool, StringComparison.OrdinalIgnoreCase))
                {
                    try
                    {
                        entry.DeleteTree();
                        flag = true;
                    }
                    catch
                    {
                        flag = false;
                    }
                }
            }
            return flag;
        }
        /// <summary>
        /// 判断程序池是否存在
        /// </summary>
        /// <param name="AppPoolName">程序池名称</param>
        /// <returns>true存在 false不存在</returns>
        public Boolean IsAppPoolName(String AppPoolName)
        {
            Boolean result = false;
            DirectoryEntry appPools = new DirectoryEntry(String.Format("IIS://{0}/W3SVC/AppPools", _hostName));
            foreach (DirectoryEntry getdir in appPools.Children)
            {
                if (getdir.Name.Equals(AppPoolName))
                {
                    result = true;
                    return result;
                }
            }
            return result;
        }

        public Boolean CreateAppPool(String appPoolName, String appPoolCommand, String appPoolState,
            String managedPipelineMode, String managedRuntimeVersion,
            String appPoolIdentityType, String Username, String Password)
        {
            Boolean issucess = false;
            try
            {
                //创建一个新程序池
                DirectoryEntry apppools = new DirectoryEntry("IIS://" + _hostName + "/W3SVC/AppPools");
                DirectoryEntry newpool = apppools.Children.Add(appPoolName, "IIsApplicationPool");

                //设置属性 访问用户名和密码 一般采取默认方式
                newpool.Properties["WAMUserName"][0] = Username;
                newpool.Properties["WAMUserPass"][0] = Password;

                //newpool.Properties["AppPoolIdentityType"].Value = "4"; //这个默认,不晓得是什么参数
                newpool.Properties["AppPoolCommand"].Value = appPoolCommand;
                newpool.Properties["AppPoolState"].Value = appPoolState;
                newpool.Properties["ManagedPipelineMode"].Value = managedPipelineMode;
                newpool.Properties["ManagedRuntimeVersion"].Value = managedRuntimeVersion;

                newpool.CommitChanges();
                issucess = true;
                return issucess;
            }
            catch // (Exception ex)
            {
                return false;
            }
        }

        public Boolean UpdateAppPool(String appPoolName, String appPoolCommand,
            String appPoolState, String managedPipelineMode, String managedRuntimeVersion,
            String Username, String Password)
        {
            Boolean issucess = false;
            try
            {
                DirectoryEntry appPoolEntry = new DirectoryEntry(String.Format("IIS://{0}/W3SVC/AppPools", _hostName));
                foreach (DirectoryEntry entry in appPoolEntry.Children)
                {
                    if (entry.Name.Equals(appPoolName, StringComparison.OrdinalIgnoreCase))
                    {
                        // entry.Properties["AppPoolIdentityType"].Value = appPoolIdentityType;
                        entry.Properties["AppPoolCommand"].Value = appPoolCommand;
                        entry.Properties["AppPoolState"].Value = appPoolState;
                        entry.Properties["ManagedPipelineMode"].Value = managedPipelineMode;
                        entry.Properties["ManagedRuntimeVersion"].Value = managedRuntimeVersion;
                        entry.CommitChanges();
                        issucess = true;
                        return issucess;
                    }
                }
            }
            catch // (Exception ex)
            {
            }
            return issucess;
        }


        /// <summary>
        /// 建立程序池后关联相应应用程序
        /// </summary>
        public void SetAppToPool(String appname, String poolName)
        {
            DirectoryEntry children = this.DirectoryEntryChildren(appname);
            foreach (DirectoryEntry childrenRoot in children.Children)
            {
                if (childrenRoot.SchemaClassName.Equals("IIsWebVirtualDir", StringComparison.OrdinalIgnoreCase))
                {
                    childrenRoot.Properties["AppPoolId"].Value = poolName;
                    childrenRoot.CommitChanges();
                    return;
                }
            }
        }
    }

    /// <summary>
    /// IIS应用程序池
    /// </summary>
    public class IISAppPoolInfo
    {
        /// <summary>
        /// 应用程序池名称
        /// </summary>
        public String AppPoolName { set; get; }

        public String AppPoolIdentityType { get; set; }

        private Int32 _AppPoolState = 2;
        /// <summary>
        /// 是否启动:2:启动,4:停止,XX:回收
        /// </summary>
        public Int32 AppPoolState
        {
            get { return _AppPoolState; }
            set { _AppPoolState = value; }
        }
        private Int32 _AppPoolCommand = 1;
        /// <summary>
        /// 立即启动应用程序池.1:以勾选,2:未勾选
        /// </summary>
        public Int32 AppPoolCommand
        {
            get { return _AppPoolCommand; }
            set { _AppPoolCommand = value; }
        }
        /// <summary>
        /// .NET Framework版本.
        /// "":无托管代码,V2.0: .NET Framework V2.0XXXX,V4.0: .NET Framework V4.0XXXX
        /// </summary>
        public String ManagedRuntimeVersion { get; set; }

        private Int32 _ManagedPipelineMode = 0;
        /// <summary>
        /// 托管管道模式.0:集成,1:经典
        /// </summary>
        public Int32 ManagedPipelineMode
        {
            get { return _ManagedPipelineMode; }
            set { _ManagedPipelineMode = value; }
        }
    }
    public sealed class IISWebManager
    {
        /// <summary>
        /// 网站名称ID
        /// </summary>
        public Int32 Name { get; set; }
        /// <summary>
        /// 网名名称
        /// </summary>
        public String ServerComment { get; set; }
        /// <summary>
        /// 应用程序池
        /// </summary>
        public String AppPoolId { set; get; }
        /// <summary>
        /// 物理路径
        /// </summary>
        public String PhysicalPath { set; get; }
        /// <summary>
        /// 绑定类型
        /// </summary>
        public String DomainType { set; get; }
        /// <summary>
        /// 绑定IP
        /// </summary>
        public String DomainIP { set; get; }

        /// <summary>
        /// 绑定端口
        /// </summary>
        public Int32 DomainPort { set; get; }
        /// <summary>
        /// 是否启动:2:启动,4:停止
        /// </summary>
        public String ServerState { set; get; }
        /// <summary>
        /// 服务命令
        /// </summary>
        public String ServerCommand { get; set; }

    }
```
