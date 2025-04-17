
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
#' InvestmentListSelectServer()
InvestmentListSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_InvestmentList_CompanyName=tsui::var_text('text_InvestmentList_CompanyName')
  text_InvestmentList_Date=tsui::var_date('text_InvestmentList_Date')




  #查询按钮

  shiny::observeEvent(input$btn_InvestmentList_select,{
    FCompanyName=text_InvestmentList_CompanyName()
    FDate=text_InvestmentList_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::InvestmentList_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='InvestmentList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_InvestmentList',data = data,filename = '对外投资.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::InvestmentList_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='InvestmentList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_InvestmentList',data = data,filename = '对外投资.xlsx')


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
#' InvestmentListServer()
InvestmentListServer <- function(input,output,session,dms_token) {
  InvestmentListSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
