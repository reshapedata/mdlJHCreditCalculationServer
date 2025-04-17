
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
#' TaxCreditListSelectServer()
TaxCreditListSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_TaxCreditList_CompanyName=tsui::var_text('text_TaxCreditList_CompanyName')
  text_TaxCreditList_Date=tsui::var_date('text_TaxCreditList_Date')




  #查询按钮

  shiny::observeEvent(input$btn_TaxCreditList_select,{
    FCompanyName=text_TaxCreditList_CompanyName()
    FDate=text_TaxCreditList_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::TaxCreditList_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='TaxCreditList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TaxCreditList',data = data,filename = '纳税信用等级.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::TaxCreditList_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='TaxCreditList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TaxCreditList',data = data,filename = '纳税信用等级.xlsx')


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
#' TaxCreditListServer()
TaxCreditListServer <- function(input,output,session,dms_token) {
  TaxCreditListSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
