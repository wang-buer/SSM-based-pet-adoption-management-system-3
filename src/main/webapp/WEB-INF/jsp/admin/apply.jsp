<%--
  Created by IntelliJ IDEA.
  User: 24255
  Date: 2019/9/5
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物领养管理后台</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="${path}/static/css/admin/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="${path}/static/css/admin/dataTables.bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/static/css/admin/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${path}/static/css/admin/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/static/css/admin/boot-crm.css" rel="stylesheet" type="text/css">
    <style>
        .panel-heading{background-color: #337ab7;border-color: #2e6da4;font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
        .panel-heading span{position:absolute;right:10px;top:12px;}
    </style>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="">流浪猫狗管理系统</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 消息通知 end -->
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="/admin/developing">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user ">
                    <li>
                        <input type="hidden" id = "currentAdminId" value="${admin.id}">
                    </li>
                    <li><a href="/admin/developing"><i class="fa fa-user fa-fw"></i>
                        管理员：${admin.adminName}</a>
                    </li>
<%--                    <li><a href="/admin/developing"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>--%>
                    <li class="divider"></li>
                    <li>
                        <a href="${path}/admin/logout">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul> <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <!-- 教学管理  折叠的分组列表 -->
                <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab">
                    <h4 class="panel-title">
                        后台管理 <span class="fa fa-chevron-up right"></span>
                    </h4>
                </div>
                <div id="collapseListGroup3" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading3">
                    <ul class="list-group">
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/user">
                                <i class="fa fa-flash fa-fw"></i> 用户信息
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/admin">
                                <i class="fa fa-flash fa-fw"></i> 管理员信息
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/pet">
                                <i class="fa fa-sitemap fa-fw"></i> 宠物管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/adopt">
                                <i class="fa fa-sitemap fa-fw"></i> 领养管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/comment">
                                <i class="fa fa-sitemap fa-fw"></i> 评论管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/blog">
                                <i class="fa fa-sitemap fa-fw"></i> 团队活动管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/apply">
                                <i class="fa fa-sitemap fa-fw"></i> 志愿者的申请
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/agree">
                                <i class="fa fa-sitemap fa-fw"></i> 同意领养列表
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${path}/admin/disAgree">
                                <i class="fa fa-sitemap fa-fw"></i> 不同意领养列表
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div><!-- 左侧显示列表部分 end-->

    </nav>
    <!-- 领养表列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">申请成为志愿者</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">
                <form class="form-inline" method="get" action="">
                    <div class="form-group">
                        <label for="findByState">申请是否被处理</label>
                        <select class="form-control" id="findByState" name="state">
                            <option value="">所有</option>
                            <option value="2">申请没有被处理</option>
                            <option value="3">申请已经被处理</option>
                        </select>
                    </div>
                    <button type="button" class="btn btn-primary" id="find_modal_btn">查询</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">领养信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="apply_table">
                        <thead>
                        <tr>
                            <%--复选框，因为没有做相关功能，就弃用了--%>
                            <%--<th>
                                <input type="checkbox" id="check_all"/>
                            </th>--%>
                            <th>编号</th>
                            <th>用户名称</th>
                            <th>Email</th>
                            <th>年龄</th>
                            <th>电话</th>
                            <th>申请理由</th>
                            <th>申请时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <div class="row">
                        <!--分页文字信息  -->
                        <div class="col-md-8" id="page_info_area"></div>
                        <!-- 分页条信息 -->
                        <div class="col-md-4" id="page_nav_area">

                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 用户查询  end-->
</div>
<!-- 修改申请静态框 -->
<div class="modal fade" id="editApply" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">修改申请信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_apply_form" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_name" class="col-sm-2 control-label">
                            申请人
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_name" placeholder="用户名称" value="${apply.name}" name="name">
                        </div>
                        <label for="edit_email" class="col-sm-2 control-label">
                            邮件
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_email" placeholder="邮件" value="${apply.email}" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_time" class="col-sm-2 control-label">
                            申请时间
                        </label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="edit_time" placeholder="时间" value="${apply.applyTime}"  name="applyTime">
                        </div>
                        <label for="edit_telephone" class="col-sm-2 control-label">
                            电话号码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_telephone" placeholder="电话" value="${apply.telephone}" name="telephone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_age" class="col-sm-2 control-label">
                            年龄
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_age" placeholder="年龄" value="${apply.age}"  name="age">
                        </div>
                        <label for="edit_message" class="col-sm-2 control-label">
                            申请理由
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_message" placeholder="申请理由" value="${apply.message}" name="message">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_state" class="col-sm-2 control-label">
                            是否被处理
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_state" value="${apply.state}" name="state">
                                <option value="2">还没有被被处理</option>
                                <option value="3">已经被处理</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="apply_updateDown_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="apply_update_btn">保存修改</button>
            </div>
        </div>
    </div>
</div>
<%--登录失效，跳转至登录--%>
<div class="modal fade" id="notlogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">登录失效</h4>
            </div>
            <div class="modal-body">
                <p>请先
                    <a href="/admin/login">登录</a>！</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<!-- jQuery -->
<script src="${path}/static/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>

<!-- 编写js代码 -->
<script type="text/javascript">

    //总的数据 当前的页面  页面容量  当前页码
    var totalRecord,currentPage,currentSize,currentPageSize;
    var currentAdminId = $("#currentAdminId").val();

    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${path}/apply/applys",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                resolving(result);
            }
        });
    }

    function resolving(result){
        //1、解析并显示员工数据
        build_adopts_table(result);
        //2、解析并显示分页信息
        build_page_info(result);
        //3、解析显示分页条数据
        build_page_nav(result);
    }
    function build_adopts_table(result){
        //清空table表格
        $("#apply_table tbody").empty();
        //index：下标 user：单个对象
        var applys=result.extend.pageInfo.list;
        $.each(applys,function(index,apply){
            /*var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");*/
            var applyIdTd = $("<td></td>").append(apply.id);
            var nameTd = $("<td></td>").append(apply.name);
            var emailTd = $("<td></td>").append(apply.email);
            var ageTd=$("<td></td>").append(apply.age);
            var telephoneTd=$("<td></td>").append(apply.telephone);
            var messageTd=$("<td></td>").append(apply.message);
            var applyTimeTd=$("<td></td>").append(apply.applyTime);
            var stateTd=null;
            if(apply.state==2){
                stateTd=$("<td></td>").append("没有被处理");
            }else{
                stateTd=$("<td></td>").append("已经被处理");
            }
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",apply.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",apply.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>")/*.append(checkBoxTd)*/
                .append(applyIdTd)
                .append(nameTd)
                .append(emailTd)
                .append(ageTd)
                .append(telephoneTd)
                .append(messageTd)
                .append(applyTimeTd)
                .append(stateTd)
                .append(btnTd)
                .appendTo("#apply_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
            result.extend.pageInfo.pages+"页,总"+
            result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.total;//最后的数据
        currentPage = result.extend.pageInfo.pageNum;//当前页
        currentSize=result.extend.pageInfo.size;//当前页面的尺寸
        currentPageSize=result.extend.pageInfo.pageSize;//每页的尺寸
    }
    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //根本没有新增按钮
    /*//点击新增按钮弹出模态框。
    $("#admin_add_modal_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#newAdmin form");
        //弹出模态框
        $("#newAdmin").modal({
            backdrop:"static"
        });
    });*/

    //点击编辑按钮弹出模态框。
    $(document).on("click",".edit_btn",function(){
        if (currentAdminId == 0){
            $("#notlogin").modal({
                backdrop:"static"
            })
        }else{
            //1、发送ajax,根据id获取用户信息
            //清除表单数据（表单完整重置（表单的数据，表单的样式））
            reset_form("#editApply form");
            var id = $(this).attr("edit-id");
            $.ajax({
                url:"${path}/apply/findById?id="+id,
                type:"GET",
                success:function(result){
                    //填充用户信息
                    console.log(result);
                    $("#edit_id").val(result.extend.apply.id);
                    $("#edit_name").val(result.extend.apply.name);
                    $("#edit_email").val(result.extend.apply.email);
                    $("#edit_age").val(result.extend.apply.age)
                    $("#edit_telephone").val(result.extend.apply.telephone);
                    $("#edit_message").val(result.extend.apply.message);
                    $("#edit_time").val(result.extend.apply.applyTime);
                    $("#edit_state").val(result.extend.apply.state);

                }});
            //2、弹出模态框
            $("#editApply").modal({
                backdrop:"static"
            });
        }
    });

    //点击更新按钮弹出模态框。
    $("#apply_update_btn").click(function(){
        var name = $("#edit_name").val();
        var telephone = $("#edit_telephone").val();
        if (name == ""){
            alert("姓名不能为空！");
        }else if (telephone == ""){
            alert("电话不能为空！");
        }else {
            $.ajax({
                url:"${path}/apply/update",
                type:"POST",
                data:$("#edit_apply_form").serialize(),
                success:function (result) {
                    alert("申请信息更新成功！");
                    $("#apply_updateDown_btn").click();
                    to_page(currentPage);
                },
                error:function(result){
                    alert("管理员信息更新失败！");
                    to_page(currentPage);
                }
            });
        }
    });

    //单个删除
    $(document).on("click",".delete_btn",function(){
        if (currentAdminId == 0){
            $("#notlogin").modal({
                backdrop:"static"
            })
        }else{
            //1、弹出是否确认删除对话框
            var name = $(this).parents("tr").find("td:eq(1)").text();
            var id = $(this).attr("del-id");
            if(confirm("确认删除【"+name+"】吗？")){
                //确认，发送ajax请求删除即可
                $.ajax({
                    url:"${path}/apply/delete?id="+id,
                    type:"GET",
                    success:function (result) {
                        if(result.code==100){
                            alert("申请删除成功！");
                            if(currentSize==1){
                                to_page(currentPage-1);
                            } else {
                                to_page(currentPage);
                            }
                        }else{
                            alert("管理员删除失败！");
                            to_page(currentPage);
                        }
                    }
                });
            }
        }
    });
    $("#find_modal_btn").click(function () {
        $("#apply_table tbody").empty();
        var state=$("#findByState").val();
        to_findByState(1,state);
    });


    function to_findByState(pn,state) {
        $.ajax({
            url:"${path}/apply/applys",
            type:"POST",
            dataType:"json",
            data:{"pn":pn,"state":state},
            async:"true",
            success:function (result) {
                build_adopts_table(result);
                build_page_info(result);
                build_page_findByState(result,state);
            },
            error:function (result) {
                alert("查询失败")
            }
        });
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_findByState(result,state){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_findByState(1,state);
            });
            prePageLi.click(function(){
                to_findByState(result.extend.pageInfo.pageNum -1,state);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_findByState(result.extend.pageInfo.pageNum +1,state);
            });
            lastPageLi.click(function(){
                to_findByState(result.extend.pageInfo.pages,state);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_findByState(item,state);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>

</body></html>
