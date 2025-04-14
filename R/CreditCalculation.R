
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
#' CreditCalculationSelectServer()
CreditCalculationSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_CreditCalculation_CompanyName=tsui::var_text('text_CreditCalculation_CompanyName')
  text_CreditCalculation_Date=tsui::var_date('text_CreditCalculation_Date')




  #查询按钮

  shiny::observeEvent(input$btn_CreditCalculation_select,{
    FCompanyName=text_CreditCalculation_CompanyName()
    FDate=text_CreditCalculation_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::CreditCalculation_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='CreditCalculation_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_CreditCalculation',data = data,filename = '信用测算信息表.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::CreditCalculation_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='CreditCalculation_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_CreditCalculation',data = data,filename = '信用测算信息表.xlsx')


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
#' CreditCalculationServer()
CreditCalculationServer <- function(input,output,session,dms_token) {
  CreditCalculationSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
