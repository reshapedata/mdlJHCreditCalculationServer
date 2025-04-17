
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
#' ExceptionSelectServer()
ExceptionSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_Exception_CompanyName=tsui::var_text('text_Exception_CompanyName')
  text_Exception_Date=tsui::var_date('text_Exception_Date')




  #查询按钮

  shiny::observeEvent(input$btn_Exception_select,{
    FCompanyName=text_Exception_CompanyName()
    FDate=text_Exception_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::Exception_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='Exception_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Exception',data = data,filename = '经营异常.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::Exception_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='Exception_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Exception',data = data,filename = '经营异常.xlsx')


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
#' ExceptionServer()
ExceptionServer <- function(input,output,session,dms_token) {
  ExceptionSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
