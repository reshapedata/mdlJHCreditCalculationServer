
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
#' EnvPunishmentSelectServer()
EnvPunishmentSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_EnvPunishment_CompanyName=tsui::var_text('text_EnvPunishment_CompanyName')
  text_EnvPunishment_Date=tsui::var_date('text_EnvPunishment_Date')




  #查询按钮

  shiny::observeEvent(input$btn_EnvPunishment_select,{
    FCompanyName=text_EnvPunishment_CompanyName()
    FDate=text_EnvPunishment_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::EnvPunishment_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='EnvPunishment_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_EnvPunishment',data = data,filename = '环保处罚.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::EnvPunishment_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='EnvPunishment_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_EnvPunishment',data = data,filename = '环保处罚.xlsx')


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
#' EnvPunishmentServer()
EnvPunishmentServer <- function(input,output,session,dms_token) {
  EnvPunishmentSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
