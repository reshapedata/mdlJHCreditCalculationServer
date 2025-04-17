
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
#' ZhiXingSelectServer()
ZhiXingSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_ZhiXing_CompanyName=tsui::var_text('text_ZhiXing_CompanyName')
  text_ZhiXing_Date=tsui::var_date('text_ZhiXing_Date')




  #查询按钮

  shiny::observeEvent(input$btn_ZhiXing_select,{
    FCompanyName=text_ZhiXing_CompanyName()
    FDate=text_ZhiXing_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::ZhiXing_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='ZhiXing_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_ZhiXing',data = data,filename = '被执行人.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::ZhiXing_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='ZhiXing_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_ZhiXing',data = data,filename = '被执行人.xlsx')


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
#' ZhiXingServer()
ZhiXingServer <- function(input,output,session,dms_token) {
  ZhiXingSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
