
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
#' TaskSelectServer()
TaskSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_Task_CompanyName=tsui::var_text('text_Task_CompanyName')
  text_Task_Date=tsui::var_date('text_Task_Date')




  #查询按钮

  shiny::observeEvent(input$btn_Task_select,{
    FCompanyName=text_Task_CompanyName()
    FDate=text_Task_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::Task_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='Task_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Task',data = data,filename = 'API查询任务.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::Task_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='Task_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_Task',data = data,filename = 'API查询任务.xlsx')


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
#' TaskServer()
TaskServer <- function(input,output,session,dms_token) {
  TaskSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
