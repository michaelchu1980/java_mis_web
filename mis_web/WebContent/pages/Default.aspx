
<html>

<head id="Head">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="cache-control" content="no-cache, must-revalidate" />
    <meta http-equiv="pragram" content="no-cache" />

    <link href="/Content/eui/themes/ui-pepper-grinder/easyui.css" rel="stylesheet" />
    <link href="/Content/eui/themes/ui-pepper-grinder/tree.css" rel="stylesheet" />
    <link href="/Content/eui/themes/icon.css" rel="stylesheet" />
    <link href="/Content/css/default.css" rel="stylesheet" />
    <link href="/Content/eui/themes/ui-pepper-grinder/menu.css" rel="stylesheet" />
    <link href="/Content/css/index.css" rel="stylesheet" />

    <script src="/Content/js/jquery-1-9-0.min.js"></script>
    <script src="/Content/eui/jquery.easyui.min.js"></script>

    <title>MACHINING COMPLEX MACHINE EFFICIENCY BOARD MANAGEMENT SYSTEM</title>

    <script type="text/javascript">
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable: false
            });
        }
        //关闭登录窗口
        function closePwd() {
            $('#w').window('close');
        }

        $(function () {
            openPwd();
            $('#editpass').click(function () {
                $('#w').window('open');
            });
            $('#btnEp').click(function () {
                serverLogin();
            });
            $('#btnCancel').click(function () { closePwd(); });

            $('#loginOut').click(function () {
                $.messager.confirm('System Prompt', 'Are you sure you want to exit the system?', function (r) {
                    if (r) {
                        //                        location.href = '';
                        window.location.href = '/Account/Logout';
                    }
                });
            });
        });

    </script>
</head>

<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <div data-options="region:'north',border:false" style="height: 40px; background: rgb(206, 21, 29)">
        <div class="headerNavs">
            <div class="logo"></div>
            <ul class="nav">



                <li><a>Welcome! &nbsp;User&nbsp;&nbsp;(General)&nbsp;&nbsp;LOGIN</a></li>
                
                <li><a href="#" id="loginOut">LOGOUT</a></li>
            </ul>
        </div>

    </div>
    <div data-options="region:'south',border:false" style="height: 30px; padding: 10px; background-color: rgb(243, 243, 243); ">        Copyright   ©2016 By TTI-IT Application Allrights Reserved.</div>

    <div data-options="region:'west',split:true,title:'MAIN MENU'" style="width:200px">
        <!--  导航内容 -->
        


<script>
    var _menus;
        $(function () {
           
            $.ajax({
                url: "/AdminData/Data_Left_Admin_Menu?="+Math.random()+"", async: false, success: function (data) {
                    _menus = eval('(' + data + ')');
                }
            })
            InitLeftMenu(_menus);
            tabClose();
            tabCloseEven();
            clockon()
        })

        //初始化左侧
        function InitLeftMenu(_menus) {
            $("#nav").accordion({ animate: false });
            $.each(_menus.menus, function (i, n) {
                var menulist = '';
                menulist += '<ul>';
                $.each(n.menus, function (j, o) {
                    menulist += '<li><div><a ref="' + o.menu_id + '" href="#" rel="' + o.menu_url + '" ><span class="icon ' + o.menu_img_url + '" >&nbsp;</span><span class="nav">' + o.menu_name + '</span></a></div></li> ';
                })
                menulist += '</ul>';
                
                $('#nav').accordion('add', {
                    title: n.menu_name,
                    content: menulist,
                    iconCls: 'icon ' + n.menu_img_url
                });

            });

            $('.easyui-accordion li a').click(function () {
                var tabTitle = $(this).children('.nav').text();

                var url = $(this).attr("rel");
                var menuid = $(this).attr("ref");
                var icon = getIcon(menuid);
                addTab(tabTitle, url, icon);
                $('.easyui-accordion li div').removeClass("selected");
                $(this).parent().addClass("selected");
            }).hover(function () {
                $(this).parent().addClass("hover");
            }, function () {
                $(this).parent().removeClass("hover");
            });
            
            //选中第一个
            var panels = $('#nav').accordion('panels');
            var t = panels[0].panel('options').title;
            $('#nav').accordion('select', t);


        }
        //获取左侧导航的图标
        function getIcon(menu_id) {
            var icon = 'icon ';
            $.each(_menus.menus, function (i, n) {
                $.each(n.menus, function (j, o) {
                    if (o.menu_id == menu_id) {
                        icon += o.menu_img_url;
                    }
                })
            })

            return icon;
            
        }

        function addTab(subtitle, url, icon) {
         if (!$('#tabs').tabs('exists', subtitle)) {
                $('#tabs').tabs('add', {
                    title: subtitle,
                    content: createFrame(url),
                    closable: true,
                    icon: icon
                });
            } else {
                $('#tabs').tabs('select', subtitle);
                $('#mm-tabupdate').click();
            }
            tabClose();
        }

        function createFrame(url) {
            var s = '<iframe scrolling="auto" frameborder="0" marginheight="0"   src="' + url + '" style="width:100%;height:100%;"></iframe>';
            return s;
        }

        function tabClose() {
            /*双击关闭TAB选项卡*/
            $(".tabs-inner").dblclick(function () {
                var subtitle = $(this).children(".tabs-closable").text();
                $('#tabs').tabs('close', subtitle);
            })
            /*为选项卡绑定右键*/
            $(".tabs-inner").bind('contextmenu', function (e) {
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });

                var subtitle = $(this).children(".tabs-closable").text();

                $('#mm').data("currtab", subtitle);
                $('#tabs').tabs('select', subtitle);
                return false;
            });
        }
        //绑定右键菜单事件
        function tabCloseEven() {
            //刷新
            $('#mm-tabupdate').click(function () {
                var currTab = $('#tabs').tabs('getSelected');
                var url = $(currTab.panel('options').content).attr('src');
                $('#tabs').tabs('update', {
                    tab: currTab,
                    options: {
                        content: createFrame(url)
                    }
                })
            })
            //关闭当前
            $('#mm-tabclose').click(function () {
                var currtab_title = $('#mm').data("currtab");
                $('#tabs').tabs('close', currtab_title);
            })
            //全部关闭
            $('#mm-tabcloseall').click(function () {
                $('.tabs-inner span').each(function (i, n) {
                    var t = $(n).text();
                    $('#tabs').tabs('close', t);
                });
            });
            //关闭除当前之外的TAB
            $('#mm-tabcloseother').click(function () {
                $('#mm-tabcloseright').click();
                $('#mm-tabcloseleft').click();
            });
            //关闭当前右侧的TAB
            $('#mm-tabcloseright').click(function () {
                var nextall = $('.tabs-selected').nextAll();
                if (nextall.length == 0) {
                    //msgShow('系统提示','后边没有啦~~','error');
                    //alert('后边没有啦~~');
                    return false;
                }
                nextall.each(function (i, n) {
                    var t = $('a:eq(0) span', $(n)).text();
                    $('#tabs').tabs('close', t);
                });
                return false;
            });
            //关闭当前左侧的TAB
            $('#mm-tabcloseleft').click(function () {
                var prevall = $('.tabs-selected').prevAll();
                if (prevall.length == 0) {
                    //alert('到头了，前边没有啦~~');
                    return false;
                }
                prevall.each(function (i, n) {
                    var t = $('a:eq(0) span', $(n)).text();
                    $('#tabs').tabs('close', t);
                });
                return false;
            });

            //退出
            $("#mm-exit").click(function () {
                $('#mm').menu('hide');
            })
        }
        //本地时钟
        function clockon() {
            var now = new Date();
            var year = now.getFullYear(); //getFullYear getYear
            var month = now.getMonth();
            var date = now.getDate();
            var day = now.getDay();
            var hour = now.getHours();
            var minu = now.getMinutes();
            var sec = now.getSeconds();
            var week;
            month = month + 1;
            if (month < 10) month = "0" + month;
            if (date < 10) date = "0" + date;
            if (hour < 10) hour = "0" + hour;
            if (minu < 10) minu = "0" + minu;
            if (sec < 10) sec = "0" + sec;
            var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
            week = arr_week[day];
            var time = "";
            time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec + " " + week;

            $("#bgclock").html(time);

            var timer = setTimeout("clockon()", 200);
        }




</script>




<div id="nav" class="easyui-accordion" fit="true" border="false">
    <!--  导航内容 -->
  
</div>
    </div>

    <div id="mainPanle" region="center" style="background: #eee; overflow:hidden;margin:0;padding:0;">
        <div id="tabs" class="easyui-tabs" fit="true" border="false">
            <div title="HOME" iconcls="icon-home" style="padding:20px;overflow:hidden; color:red;">

            </div>
        </div>
    </div>


    <div id="mm" class="easyui-menu" style="width:150px; display:none">
        <div id="mm-tabupdate">刷新</div>
        <div class="menu-sep"></div>
        <div id="mm-tabclose">关闭</div>
        <div id="mm-tabcloseall">全部关闭</div>
        <div id="mm-tabcloseother">除此之外全部关闭</div>
        <div class="menu-sep"></div>
        <div id="mm-tabcloseright">当前页右侧全部关闭</div>
        <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
        <div class="menu-sep"></div>
        <div id="mm-exit">退出</div>
    </div>

</body>
</html>