
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
#' BankInfoSelectServer()
BankInfoSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_BankInfo_CompanyName=tsui::var_text('text_BankInfo_CompanyName')
  text_BankInfo_Date=tsui::var_date('text_BankInfo_Date')




  #查询按钮

  shiny::observeEvent(input$btn_BankInfo_select,{
    FCompanyName=text_BankInfo_CompanyName()
    FDate=text_BankInfo_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::BankInfo_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='BankInfo_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_BankInfo',data = data,filename = '开票信息.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::BankInfo_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='BankInfo_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_BankInfo',data = data,filename = '开票信息.xlsx')


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
#' BankInfoServer()
BankInfoServer <- function(input,output,session,dms_token) {
  BankInfoSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
