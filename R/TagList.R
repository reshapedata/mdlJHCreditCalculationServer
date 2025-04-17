
#' 处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' TagListSelectServer()
TagListSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_TagList_CompanyName=tsui::var_text('text_TagList_CompanyName')
  text_TagList_Date=tsui::var_date('text_TagList_Date')




  #查询按钮

  shiny::observeEvent(input$btn_TagList_select,{
    FCompanyName=text_TagList_CompanyName()
    FDate=text_TagList_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::TagList_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='TagList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TagList',data = data,filename = '企业画像.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::TagList_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='TagList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TagList',data = data,filename = '企业画像.xlsx')


    }


  })



}


#' 处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' TagListServer()
TagListServer <- function(input,output,session,dms_token) {
  TagListSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
