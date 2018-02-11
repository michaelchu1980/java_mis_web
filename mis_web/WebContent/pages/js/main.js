var menu_data;
var mainPlatform = {

	init: function(){

	    this.bindEvent();
	  
		 //this.render(menu['home']);
	},

	bindEvent: function(){
		var self = this;
		// 顶部大菜单单击事件
		$(document).on('click', '.pf-nav-item', function() {
            $('.pf-nav-item').removeClass('current');
            $(this).addClass('current');

            // 渲染对应侧边菜单
            var m = $(this).data('menu');
            self.render(m);
        });
		$(document).on('click', '.sider-nav li', function () {
		    $('.sider-nav li').removeClass('current');
		    $(this).addClass('current');
		
		    //$('iframe').attr('src', $(this).data('src'));
		});
          //绑定左侧菜单点击事件
        $(document).on('click', '.sider-nav-s li', function() {
            $('.sider-nav li').removeClass('current');
            $(this).addClass('current');
            var title = $(this).attr('title');
            var url = $(this).data('src');
            var icon = $(this).data('icon');
            addTab(title, url, icon);
            //$('iframe').attr('src', $(this).data('src'));
        });

        $(document).on('click', '.pf-logout', function() {
            layer.confirm('您确定要退出吗？', {
              icon: 4,
			  title: '确定退出' //按钮
			}, function(){
			  location.href= '../../login.html'; 
			});
        });
        //左侧菜单收起
        $(document).on('click', '.toggle-icon', function() {
            $(this).closest("#pf-bd").toggleClass("toggle");
            setTimeout(function(){
            	$(window).resize();
            },300)
        });

        $(document).on('click', '.pf-modify-pwd', function() {
            $('#pf-page').find('iframe').eq(0).attr('src', 'http://www.baidu.com')
        });

        $(document).on('click', '.pf-notice-item', function() {
            $('#pf-page').find('iframe').eq(0).attr('src', 'http://www.baidu.com')
        });
	},

	render: function (m) {
	    initLeftNav(m);
	 
		
	}

};
function addTabUserInfor() {
    addTab("UserInfor", "html/ui_myinfo.html", "icon-user_suit_black");
}
function initeUserInfor() {
    $.ajax({
        url: "ashx/bg_user.ashx?action=getUserInfo&timespan=" + new Date().getTime(),
        type: "post",
        dataType: "json",
        success: function (result) {
            html = ['<h4 class="pf-user-name ellipsis">'];
          
         
            html.push( result[0].UserName+' ( ')
            html.push(result[0].DepartmentName.length > 12 ? "<span title=" + result[0].DepartmentName + ">" + result[0].DepartmentName.substring(0, 12) + "...</span>" : result[0].DepartmentName+' )');
            //长度超过12个字符就隐藏
           html.push('</h4>')
           $("#user_name").html(html.join(''));
        }
    });
}
//初始化左侧菜单
function initLeftNav(m)
{

    $.ajax({
        url: 'ashx/bg_menu.ashx?action=getUserMenu&m='+m,
        type: "get",
        async: true,
        dataType: "json",
        success: function (data) {
            menu_data = data;
            menu(menu_data,m);
        }
    })
}
//生成左侧菜单HTML
function menu(menu_data,m) {
    
    
    html = ['<h2 class="pf-model-name"><span class="pf-sider-icon"></span><span class="pf-name">' + m + '</span><span class="toggle-icon" onclick=""></span></h2>'];
    html.push('<ul class="sider-nav">');
    $.each(menu_data, function (i) {
      
        var row = menu_data[i];
      
        html.push('<li><a href="javascript:;"><span class="iconfont sider-nav-icon">&#xe620;</span><span class="sider-nav-title">' + row.text + '</span><i class="iconfont">&#xe642;</i></a>');
        html.push('<ul class="sider-nav-s">');
        var childNodes = row.children;
        for (var i = 0, len = childNodes.length; i < len; i++) {
           
            html.push('<li   data-src="' + row.children[i].attributes.url + '" title="' + row.children[i].text + '"><a ref="' + row.children[i].menu_id + '" href="#" rel"' + row.children[i].attributes.url + '">' + row.children[i].text + '</a></li>');
            
		   
        }
        html.push('</ul></li>');
    });
    html.push('</ul>');
    //$('iframe').attr('src', current.href);
    $('#pf-sider').html(html.join(''));
}
   //增加TAB
function addTab(title,url,icon)
{
    if (!$('#content_tabs').tabs('exists', title)) {
        $('#content_tabs').tabs('add', {
            title: title,
            content: createFrame(url),
            closable: true,
            icon: icon
        });
    } else {
        $('#content_tabs').tabs('select', title);
       
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
        var currTab = $('#content_tabs').tabs('getSelected');
        var url = $(currTab.panel('options').content).attr('src');
        $('#content_tabs').tabs('update', {
            tab: currTab,
            options: {
                content: createFrame(url)
            }
        })
    })
    //关闭当前
    $('#mm-tabclose').click(function () {
        var currtab_title = $('#mm').data("currtab");
        $('#content_tabs').tabs('close', currtab_title);
    })
    //全部关闭
    $('#mm-tabcloseall').click(function () {
        $('.tabs-inner span').each(function (i, n) {
            var t = $(n).text();
            $('#content_tabs').tabs('close', t);
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
            $('#content_tabs').tabs('close', t);
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
            $('#content_tabs').tabs('close', t);
        });
        return false;
    });

    //退出
    $("#mm-exit").click(function () {
        $('#mm').menu('hide');
    })
}
jQuery(document).ready(function(){
    mainPlatform.init();
    initLeftNav();
    tabCloseEven();
    initeUserInfor();
})