# Div

## 代码 1

```C#
<!-- 外层代码begin -->

<div
  style="display:none;padding: 20px; background-color: #F2F2F2;"
  id="DivTaskItem"
>
  <div class="layui-row layui-col-space15">
    <div
      class="layui-col-md12 layui-form layui-form-pane"
      lay-filter="DivTaskItem_form"
    >
      <div class="layui-card">
        <div class="layui-card-header">任务详情配置清单</div>
        <div class="layui-card-body">
          <!-- begin -->
          <div class="layui-form-item">
            <label class="layui-form-label">任务编号</label>
            <div class="layui-input-inline" style="width: 450px;">
              <input
                type="text"
                name="guid"
                autocomplete="off"
                placeholder="请输入标题"
                class="layui-input layui-disabled"
                disabled
                readonly="true"
              />
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">卖家昵称</label>
            <div class="layui-input-inline" style="width: 450px;">
              <input
                type="text"
                name="sellernick"
                placeholder="请输入"
                autocomplete="off"
                class="layui-input layui-disabled"
                disabled
                readonly="true"
              />
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-inline" style="width: 450px;">
              <input
                type="text"
                name="product_name"
                placeholder="请输入"
                autocomplete="off"
                class="layui-input layui-disabled"
                disabled
                readonly="true"
              />
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">价格合计</label>
            <div class="layui-input-inline">
              <input
                type="text"
                name="total_fee_str"
                placeholder="请输入"
                autocomplete="off"
                class="layui-input layui-disabled"
                disabled
                readonly="true"
              />
            </div>
          </div>

          <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">商品SKU</label>
            <div class="layui-input-block">
              <textarea
                name="skuinfo"
                placeholder="请输入内容"
                class="layui-textarea layui-disabled"
                disabled
                readonly="true"
              ></textarea>
            </div>
          </div>

          <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">买家留言</label>
            <div class="layui-input-block">
              <textarea
                name="buyer_message"
                placeholder="请输入内容"
                class="layui-textarea"
              ></textarea>
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">自动付款</label>
            <div class="layui-input-inline">
              <input
                type="checkbox"
                name="Automaticpayment"
                lay-skin="switch"
                lay-text="开|关"
              />
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">支付密码</label>
            <div class="layui-input-inline">
              <input
                type="password"
                name="alipaypassword"
                placeholder="请输入密码"
                autocomplete="off"
                class="layui-input"
              />
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">任务状态</label>
            <div class="layui-input-inline">
              <input
                type="text"
                name="runtype"
                placeholder="请输入"
                autocomplete="off"
                class="layui-input layui-disabled"
                disabled
                readonly="true"
              />
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">启动时间</label>
            <div class="layui-input-inline">
              <input
                type="text"
                name="runtime"
                placeholder="请输入"
                autocomplete="off"
                class="layui-input "
              />
            </div>
          </div>

          <div class="layui-form-item">
            <!-- <label class="layui-form-label">提交</label> -->
            <div class="layui-input-inline">
              <button
                class="layui-btn layui-btn-normal"
                lay-submit=""
                lay-filter="DivTaskItem_formsub"
              >
                保存
              </button>
              <button
                class="layui-btn layui-btn-normal"
                lay-submit=""
                lay-filter="DivTaskItem_formclose"
              >
                关闭
              </button>
            </div>
          </div>

          <!-- end -->
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 外层代码end -->
```
