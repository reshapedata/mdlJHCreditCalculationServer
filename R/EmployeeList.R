
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
#' EmployeeListSelectServer()
EmployeeListSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_EmployeeList_CompanyName=tsui::var_text('text_EmployeeList_CompanyName')
  text_EmployeeList_Date=tsui::var_date('text_EmployeeList_Date')




  #查询按钮

  shiny::observeEvent(input$btn_EmployeeList_select,{
    FCompanyName=text_EmployeeList_CompanyName()
    FDate=text_EmployeeList_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::EmployeeList_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='EmployeeList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_EmployeeList',data = data,filename = '主要人员.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::EmployeeList_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='EmployeeList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_EmployeeList',data = data,filename = '主要人员.xlsx')


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
#' EmployeeListServer()
EmployeeListServer <- function(input,output,session,dms_token) {
  EmployeeListSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
