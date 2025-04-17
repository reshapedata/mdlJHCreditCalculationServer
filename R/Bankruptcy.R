
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
#' BankruptcySelectServer()
BankruptcySelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_Bankruptcy_CompanyName=tsui::var_text('text_Bankruptcy_CompanyName')
  text_Bankruptcy_Date=tsui::var_date('text_Bankruptcy_Date')




  #查询按钮

  shiny::observeEvent(input$btn_Bankruptcy_select,{
    FCompanyName=text_Bankruptcy_CompanyName()
    FDate=text_Bankruptcy_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::Bankruptcy_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='Bankruptcy_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Bankruptcy',data = data,filename = '破产重整.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::Bankruptcy_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='Bankruptcy_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Bankruptcy',data = data,filename = '破产重整.xlsx')


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
#' BankruptcyServer()
BankruptcyServer <- function(input,output,session,dms_token) {
  BankruptcySelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
