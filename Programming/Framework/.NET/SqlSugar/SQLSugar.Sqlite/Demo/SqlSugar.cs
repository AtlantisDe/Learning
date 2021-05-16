using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Net5ClassLibrary1
{
    public class SqlSugar
    {

        public static String ConnectionString = @"DataSource=D:\Soft\DataBase\Sqlite\DemoTest\SqlSugar4xTest.sqlite";
        /// <summary>数据库对象实例</summary>
        public static SqlSugarClient GetInstance()
        {

            SqlSugarClient db = new SqlSugarClient(new ConnectionConfig()
            {
                DbType = DbType.Sqlite,
                ConnectionString = SqlSugar.ConnectionString,
                InitKeyType = InitKeyType.Attribute,
                IsAutoCloseConnection = true,
                AopEvents = new AopEvents
                {
                    OnLogExecuting = (sql, p) =>
                    {
                        Console.WriteLine(sql);
                        Console.WriteLine(string.Join(",", p?.Select(it => it.ParameterName + ":" + it.Value)));
                    }
                }
            });

            return db;
        }

        /// <summary>测试学生实体</summary>
        public class Student
        {
            [SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
            public int Id { get; set; }
            public int? SchoolId { get; set; }
            public string Name { get; set; }
        }

        /// <summary>测试姓名实体</summary>
        public class StudentNames
        {
            [SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
            public int Id { get; set; }
            public string Name { get; set; }
        }

        /// <summary>CodeFirst实体生成表</summary>
        public static bool FunCodeFirstInitTables()
        {
            SqlSugarClient db = new SqlSugarClient(new ConnectionConfig()
            {
                ConnectionString = SqlSugar.ConnectionString,
                DbType = DbType.Sqlite,
                IsAutoCloseConnection = true,
                InitKeyType = InitKeyType.Attribute
            });


            db.CodeFirst.InitTables(typeof(Student), typeof(StudentNames));


            return true;
        }
    }
}
