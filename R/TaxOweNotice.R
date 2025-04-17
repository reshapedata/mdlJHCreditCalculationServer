
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
#' TaxOweNoticeSelectServer()
TaxOweNoticeSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_TaxOweNotice_CompanyName=tsui::var_text('text_TaxOweNotice_CompanyName')
  text_TaxOweNotice_Date=tsui::var_date('text_TaxOweNotice_Date')




  #查询按钮

  shiny::observeEvent(input$btn_TaxOweNotice_select,{
    FCompanyName=text_TaxOweNotice_CompanyName()
    FDate=text_TaxOweNotice_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::TaxOweNotice_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='TaxOweNotice_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TaxOweNotice',data = data,filename = '欠税公告.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::TaxOweNotice_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='TaxOweNotice_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TaxOweNotice',data = data,filename = '欠税公告.xlsx')


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
#' TaxOweNoticeServer()
TaxOweNoticeServer <- function(input,output,session,dms_token) {
  TaxOweNoticeSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
