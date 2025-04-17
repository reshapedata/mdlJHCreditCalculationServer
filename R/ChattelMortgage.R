
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
#' ChattelMortgageSelectServer()
ChattelMortgageSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_ChattelMortgage_CompanyName=tsui::var_text('text_ChattelMortgage_CompanyName')
  text_ChattelMortgage_Date=tsui::var_date('text_ChattelMortgage_Date')




  #查询按钮

  shiny::observeEvent(input$btn_ChattelMortgage_select,{
    FCompanyName=text_ChattelMortgage_CompanyName()
    FDate=text_ChattelMortgage_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::ChattelMortgage_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='ChattelMortgage_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_ChattelMortgage',data = data,filename = '动产抵押.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::ChattelMortgage_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='ChattelMortgage_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_ChattelMortgage',data = data,filename = '动产抵押.xlsx')


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
#' ChattelMortgageServer()
ChattelMortgageServer <- function(input,output,session,dms_token) {
  ChattelMortgageSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
