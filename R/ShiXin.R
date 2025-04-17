
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
#' ShiXinSelectServer()
ShiXinSelectServer <- function(input,output,session,dms_token) {
  #获取参数
  text_ShiXin_CompanyName=tsui::var_text('text_ShiXin_CompanyName')
  text_ShiXin_Date=tsui::var_date('text_ShiXin_Date')




  #查询按钮

  shiny::observeEvent(input$btn_ShiXin_select,{
    FCompanyName=text_ShiXin_CompanyName()
    FDate=text_ShiXin_Date()

    if(FCompanyName==''  || is.null(FCompanyName)){


      data=mdlJHCreditCalculationPkg::ShiXin_selectByDate(dms_token =dms_token ,FDate = FDate)
      tsui::run_dataTable2(id ='ShiXin_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_ShiXin',data = data,filename = '失信被执行人.xlsx')


    }else{
      data=mdlJHCreditCalculationPkg::ShiXin_selectByCompany(dms_token =dms_token ,FCompanyName =FCompanyName ,FDate = FDate)
      tsui::run_dataTable2(id ='ShiXin_resultView' ,data =data )

      tsui::run_download_xlsx(id = 'dl_ShiXin',data = data,filename = '失信被执行人.xlsx')


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
#' ShiXinServer()
ShiXinServer <- function(input,output,session,dms_token) {
  ShiXinSelectServer(input = input,output = output,session = session,dms_token = dms_token)


}
