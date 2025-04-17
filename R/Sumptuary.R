
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
#' SumptuarySelectServer()
SumptuarySelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_Sumptuary_CompanyName=tsui::var_text('text_Sumptuary_CompanyName')
  text_Sumptuary_Date=tsui::var_date('text_Sumptuary_Date')




  #查询按钮

  shiny::observeEvent(input$btn_Sumptuary_select,{
    FCompanyName=text_Sumptuary_CompanyName()
    FDate=text_Sumptuary_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::Sumptuary_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='Sumptuary_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Sumptuary',data = data,filename = '限制高消费.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::Sumptuary_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='Sumptuary_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Sumptuary',data = data,filename = '限制高消费.xlsx')


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
#' SumptuaryServer()
SumptuaryServer <- function(input,output,session,dms_token) {
  SumptuarySelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
