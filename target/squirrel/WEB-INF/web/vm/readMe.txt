Velocity模板(VM)语言介绍
   Velocity是一个基于java的模板化引擎，它允许任何人仅仅简单的使用模板语言（template language）来引用由java代码定义的对象。
     在定义一个页面模板时，它的使用和el表达式很像，但却不同。
     1.获取java渲染参数：${},详情见4
              定义变量：#set($varName=value)来定义变量 
              判断语句：#if()
              循环语句：#foreach($item in $items)
                注意： 实际使用发现： Velocity对空格的使用非常严格，非必要情况不要乱加空格，其中，数字的运算必须加空格：
             eg:   #set($preIndex=${pageIndex} - 1) 这里如果不加空格它就会报一个莫名其妙的错误。
     2.模板中使用的Velocity模板的语法，会在渲染时转变为数值，其他语句都会变为字符串，原意输出。分页模板中的jsp标签和语句会
             输出到页面转化为标签等继续使用。不要使用el表达式，或者jstl其他的标签，和Velocity的语法冲突。
     3.想了解更多Velocity语言，提供网址：http://www.blogjava.net/caizh2009/archive/2010/08/20/329495.html。
     4.java会用HtmlRenderUtils.render(inputStream, map, new HtmlRenderUtils.VelocityRender())来渲染模板，
      inputStream为模板的输入流， 也可使用另一重载方法，传入字符串；
      map就像是传入的一个域对象，就像request域。在模板中，Velocity语言使用${varName}来获取来获取对象值；
      new HtmlRenderUtils.VelocityRender()为定义的渲染策略，这里是Velocity模板，也可以使用其他的模板。
  分页实现步骤：
    1.使用 Velocity定义模板
    2.使用HtmlRenderUtils工具类的render函数，用指定的map对Velocity模板进行渲染，然后将渲染后得到的 htmlString为内容返回
    3.使用jstl的方法调用，和jsp自定义标签类似，但定义起来简单，使用时： ${prs:buildPageNav(page,"#pageDiv") }直接调用tld文件中
          指定的方法，标签中的变量为el表达式，直接获取域中的值，方法输出Velocity模板的字符串，并渲染为页面元素。
    