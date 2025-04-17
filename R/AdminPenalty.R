
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
#' AdminPenaltySelectServer()
AdminPenaltySelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_AdminPenalty_CompanyName=tsui::var_text('text_AdminPenalty_CompanyName')
  text_AdminPenalty_Date=tsui::var_date('text_AdminPenalty_Date')




  #查询按钮

  shiny::observeEvent(input$btn_AdminPenalty_select,{
    FCompanyName=text_AdminPenalty_CompanyName()
    FDate=text_AdminPenalty_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::AdminPenalty_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='AdminPenalty_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_AdminPenalty',data = data,filename = '行政处罚.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::AdminPenalty_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='AdminPenalty_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_AdminPenalty',data = data,filename = '行政处罚.xlsx')


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
#' AdminPenaltyServer()
AdminPenaltyServer <- function(input,output,session,dms_token) {
  AdminPenaltySelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
