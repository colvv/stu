<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 为了确保适当的绘制和触屏缩放，需要在<head>之中添加viewport元数据标签 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生管理系统</title>
<%@include file="/include/commonHead.jsp"%>
<style>


</style>
</head>
<body>
	<h1>您好，世界<small>您好，世界</small></h1>
	<h2>您好，世界</h2>
	<h3>您好，世界</h3>
	<h4>您好，世界</h4>
	<h5>您好，世界</h5>
	<h6>您好，世界</h6>
	<h6><small>您好，世界</small></h6>
<p class="lead">Bacon ipsum dolor sit amet tri-tip pork loin ball tip frankfurter
swine boudin meatloaf shoulder short ribs cow drumstick beef jowl.
Meatball chicken sausage tail, <small>kielbasa strip steak turducken venison prosciutto.
Chuck filet mignon tri- tip ribeye</small>, <strong>flank brisket leberkas</strong>. Swine turducken
turkey shank, hamburger beef ribs bresaola pastrami venison rump.</p>
<small>本行内容是在标签内</small><br>
<strong>本行内容是在标签内</strong><br>
<em>本行内容是在标签内，并呈现为斜体</em><br>
<p class="text-left">向左对齐文本</p>
<p class="text-center">居中对齐文本</p>
<p class="text-right">向右对齐文本</p>
<p class="text-muted">本行内容是减弱的</p>
<p class="text-primary">本行内容带有一个 warning class</p>
<p class="text-success">本行内容带有一个 success class</p>
<p class="text-info">本行内容带有一个 info class</p>
<p class="text-warning">本行内容带有一个 warning class</p>
<p class="text-danger">本行内容带有一个 danger class</p>
<span class="text-left">向左对齐文本</span>
<span class="text-center">居中对齐文本</span>
<span class="text-right">向右对齐文本</span>
<span class="text-muted">本行内容是减弱的</span>
<span class="text-primary">本行内容带有一个 warning class</span>
<span class="text-success">本行内容带有一个 success class</span>
<span class="text-info">本行内容带有一个 info class</span>
<span class="text-warning">本行内容带有一个 warning class</span>
<span class="text-danger">本行内容带有一个 danger class</span>
<abbr title="World Wide Web">WWW</abbr><br>
<abbr title="Real Simple Syndication" class="initialism">RSS</abbr>
<abbr title="Real Simple Syndication" >RSS</abbr>
<address>
 <strong>O'Reilly Media, Inc.</strong><br>
16 ｜  第 2 章
 1005 Gravenstein HWY North<br>
 Sebastopol, CA 95472<br>
 <abbr title="Phone">P:</abbr>
 <a href="tel:+17078277000">(707) 827-7000</a>
</address>
<address>
 <strong>Jake Spurlock</strong><br>
 <a href="mailto:5vwy89@163.com">flast@oreilly.com</a>
</address>
<blockquote><p>
这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。这是一个默认的引用实例。</p></blockquote>
<blockquote>这是一个带有源标题的引用。<small>Someone famous in <cite title="Source Title">Source Title</cite></small></blockquote>
<blockquote class="pull-right">这是一个向右对齐的引用。<small>Someone famous in <cite title="Source Title">Source Title</cite></small></blockquote>
<h4>有序列表</h4>
<ol>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
  <li>Item 4</li>
</ol>
<h4>无序列表</h4>
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
  <li>Item 4</li>
</ul>
<h4>未定义样式列表</h4>
<ul class="list-unstyled">
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
  <li>Item 4</li>
</ul>
<h4>内联列表</h4>
<ul class="list-inline">
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
  <li>Item 4</li>
</ul>
<h4>定义列表</h4>
<dl>
  <dt>Description 1</dt>
  <dd>Item 1</dd>
  <dt>Description 2</dt>
  <dd>Item 2</dd>
</dl>
<h4>水平的定义列表</h4>
<dl class="dl-horizontal">
  <dt>Description 1</dt>
  <dd>Item 1</dd>
  <dt>Description 2</dt>
  <dd>Item 2</dd>
</dl>
You can use the mark tag to <mark>highlight</mark> text.
<del>被删除的内容，带中间一条线.</del>

<p><code>&lt;header&gt;</code> 作为内联元素被包围。</p>
<p>如果需要把代码显示为一个独立的块元素，请使用 &lt;pre&gt; 标签：</p>
<pre>
  &lt;article&gt;
    &lt;h1&gt;Article Heading&lt;/h1&gt;
  &lt;/article&gt;
</pre>

<table class="table table-striped table-hover table-bordered">
   <caption>基本的表格布局</caption>
   <thead>
      <tr>
         <th>名称</th>
         <th>城市</th>
      </tr>
   </thead>
   <tbody>
      <tr class="">
         <td>Tanmay</td>
         <td>Bangalore</td>
      </tr>
      <tr class="active">
         <td>Sachin</td>
         <td>Mumbai</td>
      </tr>
      <tr class="success">
         <td>Tanmay</td>
         <td>Bangalore</td>
      </tr>
      <tr class="info">
         <td>Sachin</td>
         <td>Mumbai</td>
      </tr>
      <tr class="warning">
         <td>Tanmay</td>
         <td>Bangalore</td>
      </tr>
      <tr class="danger">
         <td>Sachin</td>
         <td>Mumbai</td>
      </tr>
      <tr class="">
         <td>Tanmay</td>
         <td>Bangalore</td>
      </tr>
      <tr class="">
         <td>Sachin</td>
         <td>Mumbai</td>
      </tr>
   </tbody>
</table>


<form role="form">
   <div class="form-group">
      <label for="name">名称</label>
      <input type="text" class="form-control" id="name" 
         placeholder="请输入名称">
   </div>
   <div class="form-group">
      <label for="inputfile">文件输入</label>
      <input type="file" id="inputfile">
      <p class="help-block">这里是块级帮助文本的实例。</p>
   </div>
   <div class="checkbox">
      <label>
      <input type="checkbox"> 请打勾
      </label>
   </div>
   <button type="submit" class="btn btn-default">提交</button>
</form>

<form class="form-inline" role="form">
   <div class="form-group">
      <label class="sr-only" for="name">名称</label>
      <input type="text" class="form-control" id="name" 
         placeholder="请输入名称">
   </div>
   <div class="form-group">
      <label class="sr-only" for="inputfile">文件输入</label>
      <input type="file" id="inputfile">
   </div>
   <div class="checkbox">
      <label>
      <input type="checkbox"> 请打勾
      </label>
   </div>
   <button type="submit" class="btn btn-default">提交</button>
</form>
<form class="form-horizontal" role="form">
   <div class="form-group">
      <label for="firstname" class="col-sm-2 control-label">名字</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="firstname" 
            placeholder="请输入名字">
      </div>
   </div>
   <div class="form-group">
      <label for="lastname" class="col-sm-2 control-label">姓</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="lastname" 
            placeholder="请输入姓">
      </div>
   </div>
   <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
         <div class="checkbox">
            <label>
               <input type="checkbox"> 请记住我
            </label>
         </div>
      </div>
   </div>
   <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
         <button type="submit" class="btn btn-default">登录</button>
      </div>
   </div>
</form>

</body>
</html>