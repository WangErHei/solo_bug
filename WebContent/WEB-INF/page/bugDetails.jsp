<%@ page language="java" contentType="text/html; charset=utf-8"  import="java.util.*"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html class=" dk_fouc">

<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>工作台</title>
<link type="image/x-icon" rel="icon" href="<%=path%>/img/favic.ico"/>
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/font-awesome-4.4.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="<%=path %>/css/bootstrap-datepicker.min.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/jquery.minicolors.css">
		<link rel="stylesheet" href="<%=path %>/css/animate.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/public.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/bugClose.css" type="text/css">
		<link rel="stylesheet" href="<%=path %>/css/project.css" type="text/css">
		<script type="text/javascript" src="<%=path %>/js/utils.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
		<link rel="stylesheet" href="<%=path %>/css/layer.css" id="layui_layer_skinlayercss">
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="xml" src="<%=path %>/js/xml.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="dropkick" src="<%=path %>/js/jquery.dropkick-1.0.0.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="slimScroll" src="<%=path %>/js/jquery.slimscroll.min.1.3.8.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="utils" src="<%=path %>/js/utils.js"></script>
		<script type="text/javascript" charset="utf-8" async data-requirecontext="_" data-requiremodule="qrcode" src="<%=path %>/js/jquery.qrcode.min.js"></script>
	<script src="<%=path %>/js/ajaxfileupload.js" type="text/javascript"></script>
<script> 
		$(function(){
			meber() ;
		//	meber1() ;
	    //	meber2();
		//	meber3();
			meber4();
			meber5();
			meber6();
		});
		
</script> 

	<script type="text/javascript">
	var mm;
	var nn;
	
	
	function meber() {
		 $.post("<%=path%>/toMember",{
			"pid":"${pid}"
				},function(listmember){				
					var jsonlist = eval(listmember);
					var option="<option>[未指定]</option>";
					for(var i  in jsonlist){		
						option = option + "<option value='"+jsonlist[i].buser_name+"'>"+jsonlist[i].buser_name+"</option>";					
					}
				
					$("#bugFixToSelect").html(option);
					}); 
	}
	
	
	function meber1() {
		 $.post("<%=path%>/toMember",{
			"pid":"${pid}"
				},function(listmember){				
					var jsonlist = eval(listmember);
					var option="<option>[未指定]</option>";
					for(var i  in jsonlist){		
						option = option + "<option value='"+jsonlist[i].buser_name+"' >"+jsonlist[i].buser_name+"</option>";
					}
					$("#BugReopenAssignToSelect").html(option);
					}); 
	}
	
	
	function meber2() {
		 $.post("<%=path%>/toMember",{
			"pid":"${pid}"
				},function(listmember){				
					var jsonlist = eval(listmember);
					var option="<option>[未指定]</option>";
					for(var i  in jsonlist){		
						option = option + "<option value='"+jsonlist[i].buser_name+"'>"+jsonlist[i].buser_name+"</option>";
					}
					$("#bugFixToSelect9").html(option);
					}); 
	}
	
	function meber3() {
		 $.post("<%=path%>/toMember",{
			"pid":"${pid}"
				},function(listmember){				
					var jsonlist = eval(listmember);
					var option="<option>[未指定]</option>";
					for(var i  in jsonlist){		
						option = option + "<option value='"+jsonlist[i].buser_name+"'>"+jsonlist[i].buser_name+"</option>";
					}
					$("#bugFixToSelect1").html(option);
					}); 
	}
	
	function meber4() {
		 $.post("<%=path%>/toMember",{
			"pid":"${pid}"
				},function(listmember){				
					var jsonlist = eval(listmember);
					var option="<option>[未指定]</option>";
					for(var i  in jsonlist){	
						option = option + "<option value='"+jsonlist[i].buser_name+"'>"+jsonlist[i].buser_name+"</option>";
					}
					$("#done").html(option);
					}); 
	}
	
	function meber5() {
		 $.post("<%=path%>/selectProduce",{
				"produce_id":"${pid}"
					},function(listpro){
						var option="";
						var jsonlist = eval(listpro);
						for(var i  in jsonlist){					
							option = option + "<option value='"+jsonlist[i].produce_name+"'>"+jsonlist[i].produce_name+"</option>";
						}
						$("#bugProduct").html(option);
			}); 
		}
	
	function meber6() {
		 $.post("<%=path%>/toMember",{
			"pid":"${pid}"
				},function(listmember){				
					var jsonlist = eval(listmember);
					var option="<option>[未指定]</option>";
					for(var i  in jsonlist){		
						option = option + "<option value='"+jsonlist[i].buser_name+"'>"+jsonlist[i].buser_name+"</option>";
					}
					$("#bugFixToSelect2").html(option);
					}); 
	}
function ajaxFileUpload(){
    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile1',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile1',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results').val(result.result);
        var b= $('#resultss').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
function ajaxFileUpload1(){

    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile2',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result1').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload1(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile2',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results1').val(result.result);
        var b= $('#resultss1').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
      
function ajaxFileUpload2(){

    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile3',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result2').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload2(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile3',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results2').val(result.result);
        var b= $('#resultss2').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
function ajaxFileUpload3(){

    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile4',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result3').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload3(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile4',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results3').val(result.result);
        var b= $('#resultss3').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
      
      
function ajaxFileUpload4(){

    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile5',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result4').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload4(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile5',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results4').val(result.result);
        var b= $('#resultss4').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
      
function ajaxFileUpload5(){
    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile6',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result5').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload5(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile6',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results5').val(result.result);
        var b= $('#resultss5').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
      
      
function ajaxFileUpload6(){
    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile7',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result6').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload6(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile7',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results6').val(result.result);
        var b= $('#resultss6').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
      
function ajaxFileUpload7(){
    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile8',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result7').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload7(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile8',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results7').val(result.result);
        var b= $('#resultss7').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
      
      
function ajaxFileUpload8(){
    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile9',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result8').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload8(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile9',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results8').val(result.result);
        var b= $('#resultss8').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
      
      
function ajaxFileUpload10(){
    $.ajaxFileUpload(  		 
        {     
     url:'<%=path%>/pic/upload',           
     secureuri:false,
     fileElementId:'uploadFile11',                        //文件选择框的id属性
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     success: function (jsonStr)            //相当于java中try语句块的用法
     {      
        var a= $('#result10').val(jsonStr.result);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }
               
           );
          
      }
   
function FileUpload10(){

    $.ajaxFileUpload(
        {
     url:'<%=path%>/uploadfu',          
     secureuri:false,
     dataType: 'json',                                     //服务器返回的格式，可以是json, xml
     fileElementId:'imgfile11',                        //文件选择框的id属性
     success: function (result)            //相当于java中try语句块的用法
     {    
        var a= $('#results10').val(result.result);
        var b= $('#resultss10').val(result.oname);
     },
     error: function (data, status, e)            //相当于java中catch语句块的用法
     {
         $('#result').html('添加失败');
     }
        }       
           );         
      }
      
     </script>
   <script type="text/javascript">
   function comments() {
		var result = $("#result").val();
		var results = $("#results").val();
		var resultss = $("#resultss").val();
		var comments = $("#comments").val();
		 $.post("<%=path%>/comments",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":comments,
			"result":result,
			"results":results,
			 "resultss":resultss
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   function sign() {
		var result = $("#result1").val();
		var results = $("#results1").val();
		var resultss = $("#resultss1").val();
		var comments = $("#comments1").val();
		var maker = $("#bugFixToSelect").val();
		 $.post("<%=path%>/sign",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":comments,
			"result":result,
			"results":results,
			 "resultss":resultss,
			 "maker":maker,
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   
   function closeBUG(){
		var comments = $("#CloseServiceimp").val();	
		 $.post("<%=path%>/close",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":comments,
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   function BUGpush(){	   
		var commentss = $("#pushserviceimp").val();			
		 $.post("<%=path%>/push",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":commentss,
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   
   
   function again(){	   
	   var result = $("#result2").val();
		var results = $("#results2").val();
		var resultss = $("#resultss2").val();
		var maker = $("#BugReopenAssignToSelect").val();
		var commentss = $("#againserviceimp").val();			
		 $.post("<%=path%>/again",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":commentss,
			"result":result,
			"results":results,
			 "resultss":resultss,
			 "maker":maker,
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   
   function repair() {
		var result = $("#result3").val();
		var results = $("#results3").val();
		var resultss = $("#resultss3").val();
		var comments = $("#comments3").val();
		var maker = $("#bugFixToSelect9").val();
		 $.post("<%=path%>/repair",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":comments,
			"result":result,
			"results":results,
			 "resultss":resultss,
			 "maker":maker,
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   function pass() {
		var result = $("#result4").val();
		var results = $("#results4").val();
		var resultss = $("#resultss4").val();
		var comments = $("#passbug").val();
		 $.post("<%=path%>/pass",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":comments,
			"result":result,
			"results":results,
			 "resultss":resultss
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   function notPass(){
	 
		var result = $("#result5").val();
		var results = $("#results5").val();
		var resultss = $("#resultss5").val();
		var comments = $("#notpassbug").val();
		 $.post("<%=path%>/notpassbug",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":comments,
			"result":result,
			"results":results,
			 "resultss":resultss
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   
   
   function refuse(){
		 
		var result = $("#result6").val();
		var results = $("#results6").val();
		var resultss = $("#resultss6").val();
		var comments = $("#refuse").val();
		var reason=$("#reason").val();
		 var maker = $("#bugFixToSelect1").val();
		 $.post("<%=path%>/refuse",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":comments,
			"reason":reason,
			"result":result,
			"results":results,
			 "resultss":resultss,
		      "maker":maker
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   
   
   function donebug(){	 
		var result = $("#result7").val();
		var results = $("#results7").val();
		var resultss = $("#resultss7").val();
		var comments = $("#donecomments").val();
		 var maker = $("#done").val();
		 $.post("<%=path%>/done",{
			"bid":"${id}",
			"pid":"${pid}",
			"bug_id":"${bug[0].bug_id}",
			"content":comments,
			"result":result,
			"results":results,
			 "resultss":resultss,
		      "maker":maker
				},function(){				
					window.location.href="<%=path%>/common/bugDetails";
			});
	}
   
   
   function DeleteBug(){	   
	   
		 $.post("<%=path%>/deletebug",{
			"bug_id":"${bug[0].bug_id}",
			"pid":"${pid}",
			"bid":"${id}"
				},function(){				
					window.location.href="<%=path%>/common/bugAll";
			});
	}
   
   
   function updatebug(){	   
	   
		 $.post("<%=path%>/updatebug",{
			"bug_id":"${bug[0].bug_id}",
			"pid":"${pid}"
				},function(map){					
					$("#bugTitle").val(map.bug_title);
					$("#bugDescribe").val(map.bug_describe);
					$("#bugProduct").val(map.produce_name);
					$("#bugFixToSelect2").val(map.bug_maker);
					if(map.bug_photo==""||map.bug_photo==null){
						$("#image").hide();
					}
					$("#image").attr("src",map.bug_photo);
					$("#fu_name").html(map.bug_fu_name);			
					$("#bugType").val(map.bug_type);
					$("#result8").val(map.bug_photo);
					$("#results8").val(map.bug_fu);
					$("#resultss8").val(map.bug_fu_name);
			});
	}
   
 
    function  updateCom(a){   	
    	mm=a;
   	 $.post("<%=path%>/updatecomm",{
		   comm_id:mm,
				},function(map){					
					$("#comments10").val(map.comments_content);
					if(map.comments_photo==""||map.comments_photo==null){
						$("#image1").hide();
					}
					$("#image1").attr("src",map.comments_photo);
					$("#fu_name1").html(map.comments_fu_name);			
					$("#result10").val(map.comments_photo);
					$("#results10").val(map.comments_fu);
					$("#resultss10").val(map.comments_fu_name);
			});
	}

    
    
    function  updateSub(){
	  var co = $("#comments10").val();
       var photo1 = $("#result10").val();
       var fu1 = $("#results10").val();
       var fu_name1 = $("#resultss10").val();
    	 $.post("<%=path%>/subcomm",{
    		bug_id:"${bug[0].bug_id}",
  		   comm_id:mm,
  		   photo:photo1,
  		   fu:fu1,
  		   fu_name:fu_name1,
  		 content:co
  		},function(){				
window.location.href="<%=path%>/common/bugDetails";
			});
	}
    
    function del(d){
    	nn=d;
    }
    
    
    
     function  delCom(){
    	 $.post("<%=path%>/delcom",{		
   		   comm_id:nn,
   		bug_id:"${bug[0].bug_id}",
   		},function(){				
 window.location.href="<%=path%>/common/bugDetails";
 			});
 	}
    
   </script>
	</head>

	<body class="apps done fixed-sidebar modal-open-v">
	<header class="site-header">
		<div class="wrapper-header-left-bg"></div>
		<div class="wrapper-header">
			<span class="name"> <img src="<%=path%>/img/logozxi.png"
				height="33px">
			</span>
			<div class="wrapper-header-right">
				<div style="display: inline-block;">
					<span class="menus"><a href="<%=path%>/toprogram?id=${id}">我的项目</a></span>
					<span class="menus"> <i class="fa fa-angle-right"></i></span>
					<div class="sidebar-select" id="console-sidebar-select" alt="切换项目"
						title="切换项目">
						<div class="dk_container  dk_shown dk_theme_default"
							id="dk_container_projectSelectList" tabindex="1">
							<a class="dk_toggle"><span class="dk_label">${pname}</span> <span
								class="select-icon"><i class="fa fa-caret-down"></i></span> </a>
							<div class="dk_options">
								<div class="slimScrollDiv"
									style="position: relative; overflow: hidden; width: auto; height: 100%;">
									<ul class="dk_options_inner" style="overflow: hidden; width: auto; height: 100%;">
									    <c:forEach  items="${list1}" var="b">
											<li class="dk_option_current">						   				
												<a data-dk-dropdown-value="27221"  href="<%=path %>/change?pid=${b.pid }&pname=${b.pname}&bid=${id}">
												<img src="<%=path %>/img/app-default.jpg">${b.pname}
												<label class="badge bgBlue">${b.pnum}</label>								
												</a>						
											</li>
											</c:forEach>
										</ul>
									<div class="slimScrollBar"
										style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
									<div class="slimScrollRail"
										style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
								</div>
							</div>
						</div>
						<select style="visibility: hidden; display: none;" tabindex="1"
							id="projectSelectList">
							<option value="27221" selected="">呜呜</option>
						</select>
					</div>
					<div class="sidebar-search">
						<form name="fastSearchByNumberForm" id="fastSearchByNumberForm">
							<div class="input-group">
								<input type="text" class="form-control" id="fastKeyword"
									placeholder="BUG标题、模块" autocomplete="off"> <span
									class="input-group-btn"><button class="btn btn-default"  onclick="javascript:updateName();"
										type="button">
										<i class="fa fa-search"></i>
									</button></span>
							</div>
						</form>
					</div>
				</div>
				<div class="right">
					<div class="setting">
						<span class="username" tabindex="2">
							<div class="username-warp">
								<i class="fa fa-user"></i>
								<c:forEach items="${list}" var="a">
									<span class="username-txt textOverHiden">${a.BUSER_NAME}</span>
								</c:forEach>
							</div>
					
						</span>
					</div>
				</div>
			</div>
		</div>
	</header>
	

				<div class="wrapper" id="wrapper">
					<!-- nav start -->
					<nav class="navbar-default navbar-static-side">
						<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
							<div class="sidebar-collapse" style="overflow: hidden; width: auto; height: 100%;">
								<div class="project-img relative" id="project-img">
									<p style="background: url(img/app-default.jpg) 50% 50% / contain no-repeat;">
										<img src="<%=path %>/img/app-default.jpg" id="projectImg" border="0">
							<span class="bg"></span><a href=""><span class="btn"><i
									class="fa fa-refresh"></i><br>刷新项目</span></a>
						</p>
					</div>
								<div class="sidebar-menus-icon"><span class="fa fa-navicon" title="展开" alt="展开"></span></div>
								<ul class="nav side-menu" id="side-menu">
						<li class="divider"></li>
						<li class="li-projectInfo" data-url="" for="main" alt="项目概况"
							title="项目概况" id="projectInfoMenu"><a
							href="<%=path%>/bugInfo?bid=${id}&pid=${pid}"><i
								class="fa fa-database"></i> <span class="nav-label">项目概况</span></a><span
							class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>

						<li data-url="" for="main" alt="活动BUG" title="活动BUG"
							id="bugActiveMenu"><a
							href="<%=path%>/Programactive?bid=${id}&pid=${pid}&currpage=1"><i
								class="fa fa-clock-o"></i> <span class="nav-label">活动BUG
									<sup class="badge bgDefault" id="bugsActive">${num}</sup>
							</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
						</li>

						<li data-url="" for="main" alt="所有BUG" title="所有BUG"
							class="li-bugAll" id="bugAllMenu"><a
							href="<%=path%>/allBug?bid=${id}&pid=${pid}&currpage=1"><i
								class="fa fa-bug"></i> <span class="nav-label">所有BUG</span></a><span
							class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
						<li data-url="" for="main" alt="BUG统计" title="BUG统计"
							id="bugStatMenu" class="li-countAll" style="display: none;">
							<a href="countAll.html"><i class="fa fa-pie-chart"></i> <span
								class="nav-label">BUG统计</span></a><span
							class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
						</li>
						<li class="divider"></li>
						<li data-url="bugAssignToMe.html" for="main" alt="我的待办"
							title="我的待办" class="li-bugAssignToMe" id="bugAssignToMeMenu">
							<a href="<%=path%>/needToDo?bid=${id}&pid=${pid}&currpage=1"><i
								class="fa fa-hourglass-end"></i> <span class="nav-label">我的待办 <sup
									class="badge bgYellow" id="bugsAssignToMe">${countNeedToDo }</sup></span></a><span
							class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
						</li>
						<li data-url="bugFixByMe.html" for="main" alt="我的任务" title="我的任务"
							class="li-bugFixByMe" id="bugFixByMeMenu" style=""><a
							href="<%=path%>/myAllTask?bid=${id}&pid=${pid}&currpage=1"><i
								class="fa fa-sign-in"></i> <span class="nav-label">我的任务</span></a><span
							class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
						<li data-url="bugAssignByMe.html" for="main" alt="我的分配"
							title="我的分配" class="li-bugAssignByMe" id="bugAssignByMeMenu"
							style=""><a
							href="<%=path%>/assignOthers?bid=${id}&pid=${pid}&currpage=1"><i
								class="fa fa-sign-out"></i> <span class="nav-label">我的分配</span></a><span
							class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
						<li class="divider"></li>
						<li data-url="noticeAll.html" for="main" alt="项目通知" title="项目通知"
							class="li-noticeAll" id="noticeAllMenu"><a
							href="<%=path%>/showNotice?bid=${id }&pid=${pid}&currpage=1"><i
								class="fa fa-bullhorn"></i> <span class="nav-label">项目通知</span></a><span
							class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span></li>
								<li data-url="testCase.html" for="main" alt="测试用例" title="测试用例" class="li-testCase" id="testCaseMenu">
		                        	<a href="<%=path%>/showTestCase?bid=${id }&pid=${pid}&currpage=1"><i class="fa fa-leanpub"></i> <span class="nav-label">测试用例</span></a><span class="right fa fa-angle-left" alt="隐藏" title="隐藏"></span>
		                   		</li>
					</ul>
							</div>
							<div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; left: 1px; height: 590px; background: rgb(0, 0, 0);"></div>
							<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.9; z-index: 90; left: 1px; background: rgb(51, 51, 51);"></div>
						</div>
					</nav>
					<!-- nav end -->
					<!-- main start -->

					<!-- main end -->
				</div>
				<!-- bugModel start -->
				<!-- bug详情 -->
				<div class="bugInfoPage1" id="bugInfoPage" style="display: block;">
					<div class="bugInfoTop1">
						<span class="btn0">
				          
								<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugCommentModal" data-action="Comment">评论</button>
							<%if(("未解决".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right1") ))||("未解决".equals(session.getAttribute("state"))&&"0".equals(session.getAttribute("right1")) )||("未解决".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right")))||
									("不是错误".equals(session.getAttribute("state"))&&"2".equals(session.getAttribute("right1") ))||("不是错误".equals(session.getAttribute("state"))&&"0".equals(session.getAttribute("right1")) )||("不是错误".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right")))||
									("延期解决".equals(session.getAttribute("state"))&&"2".equals(session.getAttribute("right1") ))||("延期解决".equals(session.getAttribute("state"))&&"0".equals(session.getAttribute("right1")) )||("延期解决".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right1")))||
									("不同意意见".equals(session.getAttribute("state"))&&"2".equals(session.getAttribute("right1") ))||("不同意意见".equals(session.getAttribute("state"))&&"0".equals(session.getAttribute("right1")) )||("不同意意见".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right")))||
									("设计如此".equals(session.getAttribute("state"))&&"2".equals(session.getAttribute("right1") ))||("设计如此".equals(session.getAttribute("state"))&&"0".equals(session.getAttribute("right1")) )||("设计如此".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right")))||
									("待审核".equals(session.getAttribute("state"))&&"3".equals(session.getAttribute("right1") ))||("待审核".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right")))){ %>
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugAssignModal" data-action="Assign">指派</button> 				   
				             <% }%>
				           <%if(("未解决".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right1") )&&"缺陷".equals(session.getAttribute("type")) )||
				        		   ("未解决".equals(session.getAttribute("state"))&&"2".equals(session.getAttribute("right1") )&&"缺陷".equals(session.getAttribute("type"))) 
				        		){ %>
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugRehabilitate" data-action="Assign">修复</button> 
						   <% }%>
						   <%if(("1".equals(session.getAttribute("right1"))&&("任务".equals(session.getAttribute("type")) ||"需求".equals(session.getAttribute("type"))) &&"未解决".equals(session.getAttribute("state"))) ||
								   ("2".equals(session.getAttribute("right1"))&&("任务".equals(session.getAttribute("type")) ||"需求".equals(session.getAttribute("type"))) &&"未解决".equals(session.getAttribute("state")))
				
								   ){%>
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugSuccess" data-action="Fix">完成</button> 
					         <% }%>
					         <%if(("未解决".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right1") )) ||
					        		  ("未解决".equals(session.getAttribute("state"))&&"2".equals(session.getAttribute("right1")))  ){ %>
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugRejectModal" data-action="Reject">拒绝</button> 
					         <% }%>
					         <%if("待审核".equals(session.getAttribute("state")) &&"1".equals(session.getAttribute("right1")) 					        		 
					        		){  %>
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugApproveModal" data-action="Postpone">通过</button> 
			                   <% }%>
			                   <%if("待审核".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right1"))||			    
			                		   ("不是错误".equals(session.getAttribute("state"))||"延期解决".equals(session.getAttribute("state"))||"不同意意见".equals(session.getAttribute("state"))||"设计如此".equals(session.getAttribute("state"))) &&"1".equals(session.getAttribute("right1"))
			                		  ){ %>
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugDisapproveModal" data-action="Postpone">不通过</button>
					          <% }%>
					          <%if("未解决".equals(session.getAttribute("state")) &&("1".equals(session.getAttribute("right1") )||"1".equals(session.getAttribute("right") )||"0".equals(session.getAttribute("right1") ))||
					        		  "待审核".equals(session.getAttribute("state")) &&("1".equals(session.getAttribute("right") ))||		
					        		 ("不是错误".equals(session.getAttribute("state"))||"延期解决".equals(session.getAttribute("state"))||"不同意意见".equals(session.getAttribute("state"))||"设计如此".equals(session.getAttribute("state"))) &&("1".equals(session.getAttribute("right") ))||		
					        		"已延期".equals(session.getAttribute("state")) &&("1".equals(session.getAttribute("right") ))){ %>
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugCommentClose" data-action="Close">关闭</button> 
				                 <% }%>
				                 <%if(
				                		 "未解决".equals(session.getAttribute("state"))&&("3".equals(session.getAttribute("right1") ) || "1".equals(session.getAttribute("right") )||"1".equals(session.getAttribute("right1") )) ||
				                		 "延期解决".equals(session.getAttribute("state"))&&("1".equals(session.getAttribute("right1") ) || "1".equals(session.getAttribute("right"))||"0".equals(session.getAttribute("right1") ) )
				                		){%>
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugCommentPostpone" data-action="Postpone">延期</button> 
				               <% }%>
				               <%if("已解决".equals(session.getAttribute("state"))||"已延期".equals(session.getAttribute("state"))||"已关闭".equals(session.getAttribute("state"))){ %>
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#BugReopenModal" data-action="Postpone">再打开</button> 
							 <% }%> 
						</span>
						<span class="btn1 right">
					<%if(("未解决".equals(session.getAttribute("state"))&&"1".equals(session.getAttribute("right")))||
							("未解决".equals(session.getAttribute("state"))&&"2".equals(session.getAttribute("right1")))||
							("未解决".equals(session.getAttribute("state"))&&"3".equals(session.getAttribute("right1")))) {%>
							<i class="fa fa-edit" data-action="Modify" data-toggle="modal"  data-target="#myProjectBugEditModal" alt="修改" title="修改"   onclick="updatebug();"></i> 
					 <% }%> 
				
					 <%if("1".equals(session.getAttribute("right"))&&"未解决".equals(session.getAttribute("state"))) {%>
							<i class="fa fa-trash-o" data-action="Delete" data-toggle="modal"  data-target="#DeleteBUG" alt="删除" title="删除"></i> 
						 <% }%> 	
						</span>
						<div class="slimScrollDiv" style="margin-top: 5px; border-top: solid 1px #e9e9e9;position: relative; width: auto; height: 100%;">
							<div class="bugInfoPageNr" style=" width: auto; height: 100%;">
								<div class="panel-default bugInfo">
								<c:forEach  items="${bug}"  var="a"> 
									<div class="row">
											
										<label class="col-sm-12 control-label bugInfoTitle">
											<span class="label" style="margin-top: 5px; color:#fff;background:#337ab7">${a.bug_type }</span> 
										${a.bug_title }
										</label>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<label class="col-sm-3 control-label pd0">项目</label>
											<div class="col-sm-9 bugInfoProject txt pd0">${name}</div>
										</div>
										<div class="col-sm-6">
											<label class="col-sm-3 control-label pd0">模块</label>
											<div class="col-sm-9 bugInfoProduct txt pd0">${a.produce_name}</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<label class="col-sm-3 control-label pd0">状态</label>
											<div class="col-sm-9 bugInfoState txt pd0">
												<span class="label label-danger">${a.bug_state }</span>
											</div>
										</div>
										<div class="col-sm-6">
											<label class="col-sm-3 control-label pd0">优先级</label>
											<div class="col-sm-9 bugInfoPriority txt pd0">
												<span class="label label-danger">${a.bug_prop}</span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<label class="col-sm-3 control-label pd0">分配人</label>
											<div class="col-sm-9 bugInfoAssign txt pd0">${a.bug_signer }</div>
										</div>
										<div class="col-sm-6">
											<label class="col-sm-3 control-label pd0">处理人</label>
											<div class="col-sm-9 bugInfoFixedTo txt pd0">${a.bug_maker }</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<label class="col-sm-3 control-label pd0">计划日期</label>
											<div class="col-sm-9 txt bugInfoTreatment pd0">
												<span class="">${fn:substring(a.bug_plan_date,0,10) }</span>
											</div>
										</div>
										<div class="col-sm-6">
											<label class="col-sm-3 control-label pd0">截止日期</label>
											<div class="col-sm-9 txt bugInfoTreatment2 pd0">
												<span class="green">${fn:substring(a.bug_lasted_date,0,10) }</span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 bugInfoDescription">
											<hr class="bugInfoHr" style="margin: 0 -15px;"><br>
											<span>${a.bug_describe}</span>
										</div>
										<c:if  test="${!empty a.bug_photo}">
										<div class="bugInfoImages">
											<img src="${a.bug_photo}" class="buginfoimg-0098622541" width="600">
										</div>
										</c:if>
											<c:if  test="${!empty a.bug_fu}">
										<p class="title">附件</p>
										<p class="bugInfoPageFile">
											<a href="<%=path %>/down/fudownload?fu=${a.bug_fu}" target="_blank">
												<i class="fa fa-paperclip"></i> ${a.bug_fu_name }</a>
											
										</p>
										</c:if>
									</div>
								
									<div class="renwuHr" style="margin:0px -15px;display: none;">
										<hr>
									</div>
									</c:forEach>
									
									
									<div class="row log">
										<p class="title">日志
								
										</p>
										<div class="col-sm-12 bugInfoHistories">
										<c:forEach  items="${commentsList}" var="a">
											<p>
												<span class="name">
										<img src="${a.head1}" style="background:url(<%=path %>/img/head_default.png) center no-repeat;background-size:cover">
													<b>${a.buser_name }</b>
												</span> ${a.comments_content }
													<c:if  test="${a.buser_id == id  || right=='1'}">			
												<i class="fa fa-edit hoption" alt="修改备注" title="修改备注" data-toggle="modal" data-target="#BugCommentEditModal" data-hoption="modify" data-hid="557163" data-content=""  onclick="updateCom(${a.comments_id})"></i>
												</c:if>
												<c:if  test="${right=='1'}">	
										<i class="fa fa-trash-o hoption" alt="删除备注" title="删除备注" data-toggle="modal" data-target="#DeleteRemarks" data-hoption="delete" data-hid="557163"  onclick="del(${a.comments_id});"></i>
										</c:if>
												<span class="right">${fn:substring(a.comments_date,0,16)}</span>
												</p>
								
							<c:if  test="${!empty a.comments_photo}">
											<div class="history-imgs-div-557170">
												<div class="history-imgs-div">
													<img  src="${a.comments_photo}" alt="">
												</div>
											</div>
								</c:if>
								<c:if  test="${!empty a.comments_fu_name}">
											<div class="bugInfoPageFile">
												<a href="<%=path %>/down/fudownload?fu=${a.comments_fu}" target="_blank">
													<i class="fa fa-paperclip"></i> ${a.comments_fu_name}
												</a>
											</div>
								</c:if>	
        			</c:forEach>
										</div>
									</div>																	
								</div>							
							</div>
							
							<div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 68.7807px;"></div>
							<div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.9; z-index: 90; right: 1px;"></div>
						</div>
					</div>
				</div>

				<!-- 备注bug -->
				<div class="modal fade myProjectBugModal in" id="BugCommentModal" tabindex="-9" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 评论</h4>
							</div>
							<div class="modal-body">
									<div class="form-group relative">
										<label class="col-sm-2 control-label titleName">内容</label>
										<div class="col-sm-10 relative">
											<textarea class="form-control textarea comments" placeholder="最多输入500个字符" rows="4" id="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
											<div class="dragCommentDescDiv"></div>
										</div>
									</div>
									<div class="showAndHideImageFujianDiv">
										<div class="form-group">
										<label class="col-sm-2 control-label" style="margin-top: 5px;">图片</label>
										<div class="col-sm-10 text-right relative" style="margin-top: 5px;">
											<input type="file" id="uploadFile1" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="result"  name="result"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10"style="margin-top: 5px;">
											<input name="file" type="file" id="imgfile1"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload1" value="确定" onclick="FileUpload()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results"  name="results"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss"  name="resultss"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
									<div class="fixAssignTo"></div>
									<div class="modal-footer noborder" >
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"  onclick="comments();">提交</button>
									</div>
								</div>
						</div>
					</div>
				</div>
				<!-- 完成bug -->
				<div class="modal fade myProjectBugModal in" id="BugSuccess" tabindex="-9" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 完成</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="bugCommentModelForm">
									<div class="form-group relative">
										<label class="col-sm-2 control-label titleName">备注</label>
										<div class="col-sm-10 relative">
											<textarea class="form-control textarea comments" placeholder="最多输入500个字符" rows="4" id="donecomments" name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
											<div class="dragCommentDescDiv"></div>
										</div>
									</div>
									<div class="showAndHideImageFujianDiv" style="">
										<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile8" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload7()" style="float:left;margin-top:5px;"/>                                       
                                             <input type="text" id="result7"  name="result7"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile8"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload1" value="确定" onclick="FileUpload7()" style="float:left;margin-top:5px;"/>                                       
                                             <input type="text" id="results7"  name="results7"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss7"  name="resultss7"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">指派给</label>
											<div class="col-sm-10">
												<select class="col-sm-6" tabindex="4" id="done" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;">
												
													<option value="46604">呜呜</option>
												</select>
											</div>
										</div>
									</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"  onclick="donebug();">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				
				<!-- 修复 -->
				<div class="modal fade myProjectBugModal in" id="BugRehabilitate" tabindex="-9" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 修复</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="bugCommentModelForm">
									<div class="form-group relative">
										<label class="col-sm-2 control-label titleName">备注</label>
										<div class="col-sm-10 relative onFocus">
											<textarea class="form-control textarea comments" placeholder="最多输入500个字符"  id="comments3" rows="4" name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)" data-value="gsgd"></textarea>
											<div class="dragCommentDescDiv"></div>
										</div>
									</div>
									<div class="showAndHideImageFujianDiv" style="">
										<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile4" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload3()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="result3"  name="result3"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile4"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload1" value="确定" onclick="FileUpload3()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results3"  name="results3"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss3"  name="resultss3"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
									
									<div class="fixAssignTo">
										<div class="form-group">
											<label class="col-sm-2 control-label">指派给</label>
											<div class="col-sm-10">
											   <span  onclick="meber2();" style="font-weight:800">重新指派</span>										
												<select class="col-sm-6" tabindex="4" id="bugFixToSelect9" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;">								
													<option   value="${signer}">${signer}</option>												
												</select>
											</div>
										</div>
									</div>
										</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"  onclick="repair();">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 决绝bug -->
				<div class="modal fade myProjectBugModal in" id="BugRejectModal" tabindex="-8" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 拒绝</h4>
							</div>
							<div class="modal-body">
						
									<div class="form-group">
										<label class="col-sm-2 control-label">拒绝原因</label>
										<div class="col-sm-10">
											<select class="col-sm-6" tabindex="4" id="reason" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;">
												<option value="不是错误">不是错误</option>
												<option value="延期解决">延期解决</option>
												<option value="设计如此">设计如此</option>
												<option value="不同意建议">不同意建议</option>
				
											</select>
										</div>
									</div>
									<div class="form-group relative">
										<label class="col-sm-2 control-label">备注</label>
										<div class="col-sm-10 relative"style="margin-top: 5px;">
											<textarea class="form-control textarea comments" placeholder="最多输入500个字符" rows="4" id="refuse"name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
											<div class="dragRejectDescDiv"></div>
										</div>
									</div>
									<div class="showAndHideImageFujianDiv" style="">
										<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input style="margin-top: 5px;" type="file" id="uploadFile7" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload6()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="result6"  name="result6"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile7"  accept=".doc,doxc,txt"style="margin-top:5px;" />
											<input type="button" id="btnUpload1" value="确定" onclick="FileUpload6()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results6"  name="results6"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss6"  name="resultss6"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
										<label class="col-sm-2 control-label" style="margin-top: 15px;">指派给</label>
										<div class="col-sm-10"style="margin-top: 15px;">
										<span  onclick="meber3();" style="font-weight:800">重新指派</span>				
											<select class="col-sm-6" tabindex="4" id="bugFixToSelect1" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;">
												<option   value="${signer}">${signer}</option>
											</select>
										</div>
									</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"  onclick="refuse();">提交</button>
									</div>
								
							</div>
						</div>
					</div>
				</div>
				<!-- 关闭bug -->
				<div class="modal fade myProjectBugModal in" id="BugCommentClose" tabindex="-9" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 关闭</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="bugCommentModelForm">
									<div class="form-group relative">
										<label class="col-sm-2 control-label titleName">备注</label>
										<div class="col-sm-10 relative">
											<textarea class="form-control textarea comments"   id="CloseServiceimp"  placeholder="最多输入500个字符" rows="4" name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
											<div class="dragCommentDescDiv"></div>
										</div>
									</div>
									<div class="fixAssignTo"></div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"  onclick="closeBUG();">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 延期 -->
				<div class="modal fade myProjectBugModal in" id="BugCommentPostpone" tabindex="-9" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 延期</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="bugCommentModelForm">
									<div class="form-group relative">
										<label class="col-sm-2 control-label titleName">备注</label>
										<div class="col-sm-10 relative">
											<textarea class="form-control textarea comments" placeholder="最多输入500个字符" rows="4" id ="pushserviceimp"name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
											<div class="dragCommentDescDiv"></div>
										</div>
									</div>
									<div class="fixAssignTo"></div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"  onclick="BUGpush();">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 指派bug -->
				<div class="modal fade myProjectBugModal in" id="BugAssignModal" tabindex="-5" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 指派</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="bugAssignModelForm">
									<div class="form-group">
										<label class="col-sm-2 control-label">指派给</label>
										<div class="col-sm-10">
											<select class="col-sm-6" tabindex="4"   id="bugFixToSelect" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;">
											<option value="0" selected="">[未指定]</option>
											</select>
										</div>
									</div>
									<div class="form-group relative">
										<label class="col-sm-2 control-label">备注</label>
										<div class="col-sm-10 relative">
											<textarea class="form-control textarea comments" placeholder="最多输入500个字符" rows="4"  id="comments1"  name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
											<div class="dragAssignToDescDiv"></div>
										</div>
									</div>
									<div class="showAndHideImageFujianDiv" style="">
										<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile2" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload1()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="result1"  name="result1"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile2"  accept=".doc,doxc,txt" />
											<input  type="button" id="btnUpload1" value="确定" onclick="FileUpload1()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results1"  name="results1"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss1"  name="resultss1"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
										</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"   onclick="sign();">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 审核通过 -->
				<div class="modal fade myProjectBugModal in" id="BugApproveModal" tabindex="-7" role="dialog" data-backdrop="static" data-keyboard="false" style="display: none;">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 审核通过</h4>
							</div>
							<div class="modal-body">
						
									<div class="form-group relative">
										<label class="col-sm-2 control-label">备注</label>
										<div class="col-sm-10 relative">
											<textarea class="form-control textarea comments" placeholder="最多输入500个字符"id="passbug" rows="4" name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
											<div class="dragDisapproveDescDiv"></div>
										</div>
									</div>
										<div class="showAndHideImageFujianDiv" style="">
										<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile5" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload4()" style="float:left;margin-top:5px;"/>                                       
                                             <input type="text" id="result4"  name="result4"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile5"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload1" value="确定" onclick="FileUpload4()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results4"  name="results4"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss4"  name="resultss4"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
										</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"  onclick="pass();">提交</button>
									</div>
							
							</div>
						</div>
					</div>
				</div>
				<!-- 审核不通过 -->
				<div class="modal fade myProjectBugModal in" id="BugDisapproveModal" tabindex="-6" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 审核不通过</h4>
							</div>
							<div class="modal-body">
							
									<div class="form-group relative">
										<label class="col-sm-2 control-label">备注</label>
										<div class="col-sm-10 relative">
											<textarea class="form-control textarea comments" placeholder="最多输入500个字符" rows="4" id="notpassbug" name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
											<div class="dragDisapproveDescDiv"></div>
										</div>
									</div>
									<div class="showAndHideImageFujianDiv" style="">
										<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile6" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload5()" style="float:left;margin-top:5px;"/>                                       
                                             <input type="text" id="result5"  name="result5"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile6"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload1" value="确定" onclick="FileUpload5()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results5"  name="results5"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss5"  name="resultss5"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
										</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"  onclick="notPass();">提交</button>
									</div>
								
							</div>
						</div>
					</div>
				</div>
				<!-- 重新打开 -->
				<div class="modal fade myProjectBugModal in" id="BugReopenModal" tabindex="-4" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-cube"></i> 再打开</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="bugReopenModelForm">
									<div class="form-group relative">
										<label class="col-sm-2 control-label">备注</label>
										<div class="col-sm-10 relative">
											<textarea class="form-control textarea comments" placeholder="最多输入500个字符" rows="4" id="againserviceimp" name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
											<div class="dragReopenDescDiv"></div>
										</div>
									</div>
										<div class="showAndHideImageFujianDiv" style="">
										<div class="form-group">
										<label class="col-sm-2 control-label">图片</label>
										<div class="col-sm-10 text-right relative">
											<input type="file" id="uploadFile3" name="file"  accept=".png,.jpg" /> 
											<input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload2()" style="float:left;margin-top:5px;"/>                                       
                                             <input type="text" id="result2"  name="result2"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">附件</label>

										<div class="col-sm-10">
											<input name="file" type="file" id="imgfile3"  accept=".doc,doxc,txt" />
											<input type="button" id="btnUpload2" value="确定" onclick="FileUpload2()"style="float:left;margin-top:5px;" />                                       
                                             <input type="text" id="results2"  name="results2"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                             <input type="text" id="resultss2"  name="resultss2"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
										</div>
									</div>
								</div>
										</div>
									<div class="form-group">
										   <label class="col-sm-2 control-label">指派给</label>
										<div class="col-sm-10">
										<span  onclick="meber1();" style="font-weight:800">重新指派</span>		
											<select class="col-sm-6" tabindex="4" id="BugReopenAssignToSelect" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;">
												<option   value="${signer}">${signer}</option>					
											</select>
										</div>
									</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-info noborder"  onclick="again();">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 可修改bug -->
				<div class="modal fade myProjectBugModal in" id="myProjectBugEditModal" tabindex="-3" role="dialog" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document" style="z-index: 1040">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
								<h4><i class="fa fa-edit"></i> 修改BUG</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="bugModelForm" name="bugModelForm"  action="<%=path%>/updateBug?bid=${id}&pid=${pid}&bug_id=${bug[0].bug_id}"  method="post"  enctype="multipart/form-data">
									<div class="tabBug">
										<ul class="nav nav-tabs" role="tablist">
											<li role="presentation" class="active" style="width: 50%;">
												<a href="bugAll.html#tabBugInfo" aria-controls="tabBugInfo" role="tab" data-toggle="tab">信息与描述</a>
											</li>
											<li role="presentation" style="width: 50%;">
												<a href="bugAll.html#tabBugPlan" aria-controls="tabBugPlan" role="tab" data-toggle="tab">人员与计划</a>
											</li>
										</ul>
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane active" id="tabBugInfo">
												<div class="form-group">
													<div class="col-sm-7 pd0">
														<label class="col-sm-3 control-label pdProduct">模块</label>
														<div class="col-sm-9 pdSelect">
															<select style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" class="col-sm-12" tabindex="4" id="bugProduct"   name="module">
																<option value="1" selected="">呜呜</option>
															</select>
														</div>
													</div>
													<div class="col-sm-5 pd0">
														<label class="col-sm-5 control-label">BUG类型</label>

														<div class="col-sm-7">
															<select style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;" class="col-sm-12" tabindex="4" class="bugType" id="bugType" name="type">
																<option value="缺陷">缺陷</option>
																<option value="任务">任务</option>
																<option value="需求">需求</option>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">标题</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" placeholder="最多输入200个字符"  id="bugTitle"  name="title" onfocus="checkStrNum(this,200)" oninput="checkStrNum(this,200)" onpropertychange="checkStrNum(this,200)">
													</div>
												</div>
												
											<div class="form-group" id="bugEnvironmentDiv">
												<label class="col-sm-2 control-label">环境</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" placeholder="最多输入100个字符" name="environment" onfocus="checkStrNum(this,100)" oninput="checkStrNum(this,100)" onpropertychange="checkStrNum(this,100)" name="environment">
												</div>
											</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">描述<br></label>
													<div class="col-sm-10 relative">
														<textarea class="form-control textarea" rows="5" id="bugDescribe"name="description" placeholder="最多输入2000个字符" onfocus="checkStrNum(this,2000)" oninput="checkStrNum(this,2000)" onpropertychange="checkStrNum(this,2000)"></textarea>
														<div class="dragDescriptionDiv"></div>
													</div>
												</div>
										
									
												<div class="showAndHideImageFujianDiv" style="">
													<div class="form-group">
														<label class="col-sm-2 control-label">图片</label>
						
														<div class="col-sm-10 text-right relative">
															<div class="ui-image">
																<img   id="image" src="">
															</div>
					
														<input type="file" id="uploadFile9" name="file"  accept=".png,.jpg" /> 
											        <input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload8()" style="float:left;margin-top:5px;"/>                                       
                                                    <input type="text" id="result8"  name="result8"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label">附件</label>
														<div class="col-sm-10">
															<div id="editBugFuJian" class="fujian">
																<p class="">
																	<i class="fa fa-paperclip"></i> <span class="fj-name"  id="fu_name" ></span>
																	
																</p>
															</div>
																<input name="file" type="file" id="imgfile9"  accept=".doc,doxc,txt" />
										               	<input type="button" id="btnUpload1" value="确定" onclick="FileUpload8()" style="float:left;margin-top:5px;"/>                                       
                                                     <input type="text" id="results8"  name="results8"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                                     <input type="text" id="resultss8"  name="resultss8"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
														</div>
													</div>
												</div>
											</div>
											<div role="tabpanel" class="tab-pane" id="tabBugPlan">
												<div class="form-group">
													<div class="col-sm-6 pd0">
														<label class="col-sm-4 control-label">指派给</label>
														<div class="col-sm-8">
															<select class="col-sm-12" tabindex="4" name="handler"  id="bugFixToSelect2" style="cursor:pointer; border-radius: 4px;height: 30px;border:1px solid #CCCCCC;color: #9A9A9A;">
																<option value="0" selected="">[未指定]</option>
																<option value="46604">呜呜</option>
															</select>
														</div>
													</div>
													<div class="col-sm-6 pd0">
														<label class="col-sm-3 control-label pd20">优先级</label>
														<div class="col-sm-9">
															<input type="radio" name="priority"   value="急" style="cursor:pointer; width: 24px;height: 18px;" /> 急
															<input type="radio" name="priority" value="高" style="cursor:pointer; width: 24px;height: 18px;" /> 高
															<input type="radio" checked="" name="priority" value=" 中" style="cursor:pointer; width: 24px;height: 18px;" /> 中
															<input type="radio" name="priority" value="低" style="cursor:pointer; width: 24px;height: 18px;" /> 低
														</div>
													</div>
												</div>
												<div class="form-group" id="bugPlanDateDiv">
													<label class="col-sm-2 control-label">计划日期</label>
													<div class="col-sm-10 planDate">
														<div class="input-daterange input-group col-sm-9">
															<input style="border-radius: 4px; cursor:pointer; border: 1px solid #CCCCCC;"  id="plandate" class="col-sm-5" type="date" value=""  name="plan"/>
															<span class="col-sm-1">到</span>
															<input style="border-radius: 4px; cursor:pointer; border: 1px solid #CCCCCC;" id="lastdate" class="col-sm-5" type="date" value=""  name="last"/>
														</div>
													</div>
													<div role=" tabpanel" class="tab-pane" id="tabBugTags">
														<div class="bugTagsList"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer noborder">
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-info noborder" >提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
		
	
				<!-- 删除BUG -->
				<div class="modal fade myProjectModel myBugcloseModel in" id="DeleteBUG" tabindex="-3" role="dialog" style="z-index: 9999;">
					<div class="modal-dialog" role="document" style="z-index: 1060">
						<div class="layui-layer layui-anim layui-layer-dialog " id="layui-layer3" type="dialog" times="3" showtime="0" contype="string" style="z-index: 19891017;">
							<div class="layui-layer-title" style="">提示</div>
							<div class="layui-layer-content">确定删除该BUG？</div>
							<span class="layui-layer-setwin">
								<button type="button"  class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
							</span>
							<div class="layui-layer-btn">
								<a class="layui-layer-btn0"  onclick="DeleteBug();">确定</a>
								<a class="layui-layer-btn1" data-dismiss="modal">取消</a>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				<!-- 编辑bug评论 -->
		<div class="modal fade myProjectBugModal in" id="BugCommentEditModal" tabindex="-9" role="dialog" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog" role="document" style="z-index: 1040">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
						<h4><i class="fa fa-cube"></i> 修改备注</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="bugCommentEditModelForm">
							<input type="hidden" name="id" value="557164">
							<div class="form-group relative">
								<label class="col-sm-2 control-label titleName">备注</label>
								<div class="col-sm-10 relative">
									<textarea class="form-control textarea comments" id="comments10" placeholder="最多输入500个字符" rows="4" name="comments" onfocus="checkStrNum(this,500)" oninput="checkStrNum(this,500)" onpropertychange="checkStrNum(this,500)"></textarea>
									<div class="dragEditCommentDescDiv"></div>
								</div>
							</div>
								<div class="showAndHideImageFujianDiv" style="">
													<div class="form-group">
														<label class="col-sm-2 control-label">图片</label>
						
														<div class="col-sm-10 text-right relative">
															<div class="ui-image">
																<img   id="image1" src="">
															</div>
					
														<input type="file" id="uploadFile11" name="file"  accept=".png,.jpg" /> 
											        <input type="button" id="btnUpload" value="确定" onclick="ajaxFileUpload10()"style="float:left;margin-top:5px;" />                                       
                                                    <input type="text" id="result10"  name="result10"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label">附件</label>
														<div class="col-sm-10">
															<div id="editBugFuJian" class="fujian">
																<p class="">
																	<i class="fa fa-paperclip"></i> <span class="fj-name"  id="fu_name1" >scsdvsdvsdvsdvcsd</span>
																	
																</p>
															</div>
																<input name="file" type="file" id="imgfile11"  accept=".doc,doxc,txt" />
										               	<input type="button" id="btnUpload1" value="确定" onclick="FileUpload10()"style="float:left;margin-top:5px;" />                                       
                                                     <input type="text" id="results10"  name="results10"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px"/>
                                                     <input type="text" id="resultss10"  name="resultss10"  value=""readonly="readonly" style="float:left;margin-top:5px;border:none;margin-left:5px;width:200px""/>
														</div>
													</div>
												</div>
											</div>
							<div class="modal-footer noborder">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-info noborder"   onclick="updateSub();">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 删除备注 -->
		<div class="modal fade myProjectModel myBugcloseModel in" id="DeleteRemarks" tabindex="-3" role="dialog" style="z-index: 9999; margin-top: 50px; margin-left: -200px;">
			<div class="modal-dialog" role="document" style="z-index: 1060">
				<div class="layui-layer layui-anim layui-layer-dialog " id="layui-layer3" type="dialog" times="3" showtime="0" contype="string" style="z-index: 19891017;">
					<div class="layui-layer-title" style="">提示</div>
					<div class="layui-layer-content">确定删除备注？</div>
					<span class="layui-layer-setwin">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-remove"></i></span></button>
					</span>
					<div class="layui-layer-btn">
						<a class="layui-layer-btn0"   onclick="delCom();">确定</a>
						<a class="layui-layer-btn1" data-dismiss="modal">取消</a>
					</div>
				</div>
			</div>
		</div>
				<!-- bugModel end  -->
		
			<!-- bugTestModel end -->
			<div class="floatBugInfo"></div>
			<!--  -->
			<script type="text/javascript" src="<%=path%>/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

		</body>

</html>