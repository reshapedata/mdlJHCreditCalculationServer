
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
#' TaxAbnormalSelectServer()
TaxAbnormalSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_TaxAbnormal_CompanyName=tsui::var_text('text_TaxAbnormal_CompanyName')
  text_TaxAbnormal_Date=tsui::var_date('text_TaxAbnormal_Date')




  #查询按钮

  shiny::observeEvent(input$btn_TaxAbnormal_select,{
    FCompanyName=text_TaxAbnormal_CompanyName()
    FDate=text_TaxAbnormal_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::TaxAbnormal_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='TaxAbnormal_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TaxAbnormal',data = data,filename = '税务非正常户.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::TaxAbnormal_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='TaxAbnormal_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_TaxAbnormal',data = data,filename = '税务非正常户.xlsx')


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
#' TaxAbnormalServer()
TaxAbnormalServer <- function(input,output,session,dms_token) {
  TaxAbnormalSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
