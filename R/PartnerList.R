
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
#' PartnerListSelectServer()
PartnerListSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_PartnerList_CompanyName=tsui::var_text('text_PartnerList_CompanyName')
  text_PartnerList_Date=tsui::var_date('text_PartnerList_Date')




  #查询按钮

  shiny::observeEvent(input$btn_PartnerList_select,{
    FCompanyName=text_PartnerList_CompanyName()
    FDate=text_PartnerList_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::PartnerList_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='PartnerList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_PartnerList',data = data,filename = '股东信息.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::PartnerList_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='PartnerList_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_PartnerList',data = data,filename = '股东信息.xlsx')


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
#' PartnerListServer()
PartnerListServer <- function(input,output,session,dms_token) {
  PartnerListSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
