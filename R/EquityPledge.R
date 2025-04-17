
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
#' EquityPledgeSelectServer()
EquityPledgeSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_EquityPledge_CompanyName=tsui::var_text('text_EquityPledge_CompanyName')
  text_EquityPledge_Date=tsui::var_date('text_EquityPledge_Date')




  #查询按钮

  shiny::observeEvent(input$btn_EquityPledge_select,{
    FCompanyName=text_EquityPledge_CompanyName()
    FDate=text_EquityPledge_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::EquityPledge_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='EquityPledge_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_EquityPledge',data = data,filename = '股权出质.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::EquityPledge_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='EquityPledge_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_EquityPledge',data = data,filename = '股权出质.xlsx')


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
#' EquityPledgeServer()
EquityPledgeServer <- function(input,output,session,dms_token) {
  EquityPledgeSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
