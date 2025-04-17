
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
#' CoreSelectServer()
CoreSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_Core_CompanyName=tsui::var_text('text_Core_CompanyName')
  text_Core_Date=tsui::var_date('text_Core_Date')




  #查询按钮

  shiny::observeEvent(input$btn_Core_select,{
    FCompanyName=text_Core_CompanyName()
    FDate=text_Core_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::Core_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='Core_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Core',data = data,filename = '基本信息.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::Core_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='Core_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Core',data = data,filename = '基本信息.xlsx')


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
#' CoreServer()
CoreServer <- function(input,output,session,dms_token) {
  CoreSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
