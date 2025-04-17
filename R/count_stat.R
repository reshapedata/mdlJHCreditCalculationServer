
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
#' count_statSelectServer()
count_statSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_count_stat_CompanyName=tsui::var_text('text_count_stat_CompanyName')
  text_count_stat_Date=tsui::var_date('text_count_stat_Date')




  #查询按钮

  shiny::observeEvent(input$btn_count_stat_select,{
    FCompanyName=text_count_stat_CompanyName()
    FDate=text_count_stat_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::count_stat_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='count_stat_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_count_stat',data = data,filename = '企业征信统计表.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::count_stat_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='count_stat_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_count_stat',data = data,filename = '企业征信统计表.xlsx')


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
#' count_statServer()
count_statServer <- function(input,output,session,dms_token) {
  count_statSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
