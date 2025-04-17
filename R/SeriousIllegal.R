
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
#' SeriousIllegalSelectServer()
SeriousIllegalSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_SeriousIllegal_CompanyName=tsui::var_text('text_SeriousIllegal_CompanyName')
  text_SeriousIllegal_Date=tsui::var_date('text_SeriousIllegal_Date')




  #查询按钮

  shiny::observeEvent(input$btn_SeriousIllegal_select,{
    FCompanyName=text_SeriousIllegal_CompanyName()
    FDate=text_SeriousIllegal_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::SeriousIllegal_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='SeriousIllegal_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_SeriousIllegal',data = data,filename = '严重违法.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::SeriousIllegal_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='SeriousIllegal_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_SeriousIllegal',data = data,filename = '严重违法.xlsx')


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
#' SeriousIllegalServer()
SeriousIllegalServer <- function(input,output,session,dms_token) {
  SeriousIllegalSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
