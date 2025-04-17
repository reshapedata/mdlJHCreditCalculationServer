
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
#' EquityFreezeSelectServer()
EquityFreezeSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_EquityFreeze_CompanyName=tsui::var_text('text_EquityFreeze_CompanyName')
  text_EquityFreeze_Date=tsui::var_date('text_EquityFreeze_Date')




  #查询按钮

  shiny::observeEvent(input$btn_EquityFreeze_select,{
    FCompanyName=text_EquityFreeze_CompanyName()
    FDate=text_EquityFreeze_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::EquityFreeze_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='EquityFreeze_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_EquityFreeze',data = data,filename = '股权冻结.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::EquityFreeze_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='EquityFreeze_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_EquityFreeze',data = data,filename = '股权冻结.xlsx')


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
#' EquityFreezeServer()
EquityFreezeServer <- function(input,output,session,dms_token) {
  EquityFreezeSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
