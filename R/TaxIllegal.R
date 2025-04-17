
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
#' TaxIllegalSelectServer()
TaxIllegalSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_TaxIllegal_CompanyName=tsui::var_text('text_TaxIllegal_CompanyName')
  text_TaxIllegal_Date=tsui::var_date('text_TaxIllegal_Date')




  #查询按钮

  shiny::observeEvent(input$btn_TaxIllegal_select,{
    FCompanyName=text_TaxIllegal_CompanyName()
    FDate=text_TaxIllegal_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::TaxIllegal_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='TaxIllegal_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TaxIllegal',data = data,filename = '税收违法.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::TaxIllegal_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='TaxIllegal_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TaxIllegal',data = data,filename = '税收违法.xlsx')


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
#' TaxIllegalServer()
TaxIllegalServer <- function(input,output,session,dms_token) {
  TaxIllegalSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
