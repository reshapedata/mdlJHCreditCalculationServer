
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
#' JudicialSaleSelectServer()
JudicialSaleSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_JudicialSale_CompanyName=tsui::var_text('text_JudicialSale_CompanyName')
  text_JudicialSale_Date=tsui::var_date('text_JudicialSale_Date')




  #查询按钮

  shiny::observeEvent(input$btn_JudicialSale_select,{
    FCompanyName=text_JudicialSale_CompanyName()
    FDate=text_JudicialSale_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::JudicialSale_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='JudicialSale_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_JudicialSale',data = data,filename = '司法拍卖.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::JudicialSale_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='JudicialSale_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_JudicialSale',data = data,filename = '司法拍卖.xlsx')


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
#' JudicialSaleServer()
JudicialSaleServer <- function(input,output,session,dms_token) {
  JudicialSaleSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
