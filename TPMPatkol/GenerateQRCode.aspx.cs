using MobileTask.AppCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPMPatkol
{
    public partial class GenerateQRCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static void SP_TPM_User(int ID, string Username, string Password, string Name, string Email, string Gendor, string Type)
        {
            new ClassBrowseNew().SP_TPM_User(ID, Username, Password, Name, Email, Gendor, Type);
        }

        [WebMethod]
        public static string SP_TPM_Code_Insert(string TMPCode, string proj_num, string job_num, string lot_num, string serial_num, int TypeTPM, string CodeTypeTPM, string UpdateBy)
        {
            return new ClassBrowseNew().SP_TPM_Code_Insert(TMPCode, proj_num, job_num, lot_num, serial_num, TypeTPM, CodeTypeTPM, UpdateBy);
        }

        [WebMethod]
        public static void SP_TPM_Code_Insert_CustomerSite(string TMPCode, string cust_num_site, string Status, string effect_date, string expire_date, string StatusWork)
        {
            new ClassBrowseNew().SP_TPM_Code_Insert_CustomerSite(TMPCode, cust_num_site, Status, effect_date, expire_date, StatusWork);
        }

        [WebMethod]
        public static string SP_TPM_Code_Lot(int LotID, string StartTPMCode, string EndTPMCode)
        {
            return new ClassBrowseNew().SP_TPM_Code_Lot(LotID, StartTPMCode, EndTPMCode);
        }

        [WebMethod]
        public static void SP_TPM_Customer(string cust_num/*, string cust_name*/, string cust_address, string cust_tel, string cust_mobile, string cust_fax, string cust_logo)
        {
            new ClassBrowseNew().SP_TPM_Customer(cust_num/*, cust_name*/, cust_address, cust_tel, cust_mobile, cust_fax, cust_logo);
        }

        [WebMethod]
        public static string SP_TPM_Customer_Stie(int cust_num_site, string cust_num, string cust_site_name, string cust_address, string cust_tel, string cust_mobile, string cust_fax, string cust_latitude, string cust_longitude, string Status)
        {
            return new ClassBrowseNew().SP_TPM_Customer_Stie(cust_num_site, cust_num, cust_site_name, cust_address, cust_tel, cust_mobile, cust_fax, cust_latitude, cust_longitude, Status);
        }

        [WebMethod]
        public static void SP_TPM_Customer_Stie_WorkingDay(int cust_num_site, int Monday, int Tuesday, int Wednesday, int Thursday, int Friday, int Saturday, int Sunday)
        {
            new ClassBrowseNew().SP_TPM_Customer_Stie_WorkingDay(cust_num_site, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
        }

        [WebMethod]
        public static string SP_TPM_Customer_Member(int ID, string Users, string Customer, int Customer_Site, string Status, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Customer_Member(ID, Users, Customer, Customer_Site, Status, Status_Work);
        }

        [WebMethod]
        public static void SP_TPM_MaintenanceSystem(string TPMCode, int List_id, string Status)
        {
            new ClassBrowseNew().SP_TPM_MaintenanceSystem(TPMCode, List_id, Status);
        }

        [WebMethod]
        public static string SP_TPM_Room_Master(int ID, string Code, string Name, string Status, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Room_Master(ID, Code, Name, Status, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Machine_Main_Equipment(int ID, string Code, string Name, string Status, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Machine_Main_Equipment(ID, Code, Name, Status, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Machine_Group(int ID, int Machine_MainID, string Code, string Name, string Status, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Machine_Group(ID, Machine_MainID, Code, Name, Status, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Machine_Equipment(int ID, int Machine_GroupID, string Code, string Name, string Status, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Machine_Equipment(ID, Machine_GroupID, Code, Name, Status, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Machine_Equip_Checklist(int ID, int Machine_EquipID, string CheckID, string Status)
        {
            return new ClassBrowseNew().SP_TPM_Machine_Equip_Checklist(ID, Machine_EquipID, CheckID, Status);
        }

        [WebMethod]
        public static string SP_TPM_Compressor(int ID, string Type, string Name, int cust_num_site, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Compressor(ID, Type, Name, cust_num_site, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Maintenance_CheckList(int ID, string List_Name, string Picture, string Status, string QuestionType, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Maintenance_CheckList(ID, List_Name, Picture, Status, QuestionType, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Maintenance_CheckList_V2(int ID, string List_Name, string Picture, string Status, string QuestionType, string Yellow_Criteria, string Red_Criteria, string Criteria, int AllowEntry, int ResetRecord, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Maintenance_CheckList_V2(ID, List_Name, Picture, Status, QuestionType, Yellow_Criteria, Red_Criteria, Criteria, AllowEntry, ResetRecord, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Sub_CheckList_Maintenance(int ID, int List_ID, int List_No, string List_Name, int Priority, int Report_Status, string CreateBy, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Sub_CheckList_Maintenance(ID, List_ID, List_No, List_Name, Priority, Report_Status, CreateBy, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Compressor_Detail_insert_V2(int ID, int Compressor_ID, int Group_ID, int Equipment_ID, string CompressorSuffix, string QuestionOther, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Compressor_Detail_insert_V2(ID, Compressor_ID, Group_ID, Equipment_ID, CompressorSuffix, QuestionOther, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Compressor_Detail_insert_V3(int ID, int Compressor_ID, int Group_ID, int Equipment_ID, string CompressorSuffix, string QuestionOther, int RecordStart, double Yellow_Criteria, double Red_Criteria, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Compressor_Detail_insert_V3(ID, Compressor_ID, Group_ID, Equipment_ID, CompressorSuffix, QuestionOther, RecordStart, Yellow_Criteria, Red_Criteria, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Compressor_Set_insert(int Package_ID, int Compressor_ID, string Name, string Cust_site, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Compressor_Set_insert(Package_ID, Compressor_ID, Name, Cust_site, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Room_insert(int ID, int PakageID, int RoomID, string RoomNo, string RoomName, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Room_insert(ID, PakageID, RoomID, RoomNo, RoomName, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Machine_insert_V2(int ID, int RoomID, int Machine_MainID, int Machine_GroupID, int Machine_EquipmentID, string TPMCode, string MachineSuffix, string QuestionOther, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Machine_insert_V2(ID, RoomID, Machine_MainID, Machine_GroupID, Machine_EquipmentID, TPMCode, MachineSuffix, QuestionOther, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Machine_insert_V3(int ID, int RoomID, int Machine_MainID, int Machine_GroupID, int Machine_EquipmentID, string TPMCode, string MachineSuffix, string QuestionOther, int RecordStart, double Yellow_Criteria, double Red_Criteria, string Status_Work)
        {
            return new ClassBrowseNew().SP_TPM_Machine_insert_V3(ID, RoomID, Machine_MainID, Machine_GroupID, Machine_EquipmentID, TPMCode, MachineSuffix, QuestionOther, RecordStart, Yellow_Criteria, Red_Criteria, Status_Work);
        }

        [WebMethod]
        public static string SP_TPM_Machine_Equip_Reason(int ID, int Equipment_ID, string Reason, int Seq, string StatusReason, string Status)
        {
            return new ClassBrowseNew().SP_TPM_Machine_Equip_Reason(ID, Equipment_ID, Reason, Seq, StatusReason, Status);
        }

        [WebMethod]
        public static void SP_TPM_Machine_Equip_WorkingDay(int Equipment_ID, int Monday, int Tuesday, int Wednesday, int Thursday, int Friday, int Saturday, int Sunday)
        {
            new ClassBrowseNew().SP_TPM_Machine_Equip_WorkingDay(Equipment_ID, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
        }

        [WebMethod]
        public static void SP_TPM_Compressor_Detail_RegisterTPMCode(int ID, string TPMCode)
        {
            new ClassBrowseNew().SP_TPM_Compressor_Detail_RegisterTPMCode(ID, TPMCode);
        }

        [WebMethod]
        public static void SP_TPM_LineConfig_Header(int ID, string Msg_Name)
        {
            new ClassBrowseNew().SP_TPM_LineConfig_Header(ID, Msg_Name);
        }

        [WebMethod]
        public static void SP_TPM_LineConfig(int ID, int Seq, string msg_type, string Msg, int Header_ID)
        {
            new ClassBrowseNew().SP_TPM_LineConfig(ID, Seq, msg_type, Msg, Header_ID);
        }

        [WebMethod]
        public static void SP_TPM_Service_Team(int ID, string Team_Name)
        {
            new ClassBrowseNew().SP_TPM_Service_Team(ID, Team_Name);
        }

        [WebMethod]
        public static void SP_TPM_Service_Team_Member(int Service_ID, string Username, string Type)
        {
            new ClassBrowseNew().SP_TPM_Service_Team_Member(Service_ID, Username, Type);
        }

        [WebMethod]
        public static void SP_TPM_Service_User(string Username, string Name, string Lastname, string Role, string Status, string Type)
        {
            new ClassBrowseNew().SP_TPM_Service_User(Username, Name, Lastname, Role, Status, Type);
        }

        [WebMethod]
        public static void SP_IssueList_Update(string Username, string TPMCode, string Acting, string Status, string DueDate, string Detail, string Picture, string HoldReason, string FixStatus)
        {
            new ClassBrowseNew().SP_IssueList_Update(Username, TPMCode, Acting, Status, DueDate, Detail, Picture, HoldReason, FixStatus);
        }

        [WebMethod]
        public static void SP_IssueList_UpdateV2(int ID, string Username, string TPMCode, string Acting, string Status, string DueDate, string Detail, string Picture, string HoldReason, string FixStatus)
        {
            new ClassBrowseNew().SP_IssueList_UpdateV2(ID, Username, TPMCode, Acting, Status, DueDate, Detail, Picture, HoldReason, FixStatus);
        }

        [WebMethod]
        public static void SP_IssueList_UpdateV3(int ID, string Username, string TPMCode, string Acting, string Status, string DueDate, string Detail, string Picture, string HoldReason, string FixStatus, string IssueType)
        {
            new ClassBrowseNew().SP_IssueList_UpdateV3(ID, Username, TPMCode, Acting, Status, DueDate, Detail, Picture, HoldReason, FixStatus, IssueType);
        }

        [WebMethod]
        public static void SP_Appointment_Assign(int appNo, int team_ID, string working_date, string plan_starttime, string plan_endtime, string UserName)
        {
            new ClassBrowseNew().SP_Appointment_Assign(appNo, team_ID, working_date, plan_starttime, plan_endtime, UserName);
        }

        [WebMethod]
        public static void SP_Appointment_Assign_Trans(int appNo, int cust_site, int team_ID, string working_date, string plan_starttime, string plan_endtime, string UserName, string AppName)
        {
            new ClassBrowseNew().SP_Appointment_Assign_Trans(appNo, cust_site, team_ID, working_date, plan_starttime, plan_endtime, UserName, AppName);
        }

        [WebMethod]
        public static void SP_Appointment_Trans_Assign_Process(int appNo, string UserName)
        {
            new ClassBrowseNew().SP_Appointment_Trans_Assign_Process(appNo, UserName);
        }

        [WebMethod]
        public static void SP_Appointment_CheckIn(int appNo, string latitude, string longitude, string UserName)
        {
            new ClassBrowseNew().SP_Appointment_CheckIn(appNo, latitude, longitude, UserName);
        }

        [WebMethod]
        public static void SP_Appointment_Trans_CheckIn(int appNo, string latitude, string longitude, string UserName)
        {
            new ClassBrowseNew().SP_Appointment_Trans_CheckIn(appNo, latitude, longitude, UserName);
        }

        [WebMethod]
        public static string SP_Schedule(int ID, string cust_num_site, string Schedule, string Type)
        {
            return new ClassBrowseNew().SP_Schedule(ID, cust_num_site, Schedule, Type);
        }

        [WebMethod]
        public static void SP_TPM_Code_WorkingDay(string TPMCode, int Monday, int Tuesday, int Wednesday, int Thursday, int Friday, int Saturday, int Sunday)
        {
            new ClassBrowseNew().SP_TPM_Code_WorkingDay(TPMCode, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
        }

        [WebMethod]
        public static string SP_Customer_Report(int ID, int cust_site, string TypeReport, string ReportName, string Username)
        {
            return new ClassBrowseNew().SP_Customer_Report(ID, cust_site, TypeReport, ReportName, Username);
        }

        [WebMethod]
        public static void SP_Customer_Report_Detail(int ID, int Cust_Report_ID, int ListLevel, int CheckList_ID, string HeaderName, string TypeDetail, string Username, string Status)
        {
            new ClassBrowseNew().SP_Customer_Report_Detail(ID, Cust_Report_ID, ListLevel, CheckList_ID, HeaderName, TypeDetail, Username, Status);
        }

        [WebMethod]
        public static void SP_HelpTool_Customize_Type(int ID, string Name, string Type_Location)
        {
            new ClassBrowseNew().SP_HelpTool_Customize_Type(ID, Name, Type_Location);
        }

        [WebMethod]
        public static void SP_HelpTool_Customize_Main_Guide(int ID, string Name_Guide, int Location_ID)
        {
            new ClassBrowseNew().SP_HelpTool_Customize_Main_Guide(ID, Name_Guide, Location_ID);
        }

        [WebMethod]
        public static void SP_HelpTool_Customize_Step(int ID, int Main_ID, int StepNo, string StepName)
        {
            new ClassBrowseNew().SP_HelpTool_Customize_Step(ID, Main_ID, StepNo, StepName);
        }

        [WebMethod]
        public static string SP_HelpTool_Customize_Step_Detail(int ID, int Step_ID, int ListNo, string IMG_Path, string Description)
        {
            return new ClassBrowseNew().SP_HelpTool_Customize_Step_Detail(ID, Step_ID, ListNo, IMG_Path, Description);
        }
        [WebMethod]
        public static List<List<ArrayList>> SP_Monitoring_Report(string stcMonth, string stcYear)
        {
            return new ClassBrowseNew().SP_Monitoring_Report(stcMonth, stcYear);
        }


        [WebMethod]
        public static String[] GetTPMCode(string TPMCode)
        {
            return new ClassBrowseNew().GetTPMCode(TPMCode);
        }

        [WebMethod]
        public static List<String[]> GetLotTPMCode(string LotID, string Search)
        {
            return new ClassBrowseNew().GetLotTPMCode(LotID, Search);
        }

        [WebMethod]
        public static List<String[]> GetListCustomer(string cust_num, string search)
        {
            return new ClassBrowseNew().GetListCustomer(cust_num, search);
        }

        [WebMethod]
        public static List<ArrayList> GetListUser(string ID)
        {
            return new ClassBrowseNew().GetListUser(ID);
        }

        [WebMethod]
        public static List<String[]> GetUserTPMPatkol(string Customer_Code)
        {
            return new ClassBrowseNew().GetUserTPMPatkol(Customer_Code);
        }

        [WebMethod]
        public static List<String[]> GetListCustomerSite(string cust_num)
        {
            return new ClassBrowseNew().GetListCustomerSite(cust_num);
        }

        [WebMethod]
        public static List<String[]> GetListMachineMember(string TPMCode)
        {
            return new ClassBrowseNew().GetListMachineMember(TPMCode);
        }

        [WebMethod]
        public static List<String[]> GetListCustomerMember(string cust_num)
        {
            return new ClassBrowseNew().GetListCustomerMember(cust_num);
        }

        [WebMethod]
        public static List<String[]> GetListCheckList(string ID)
        {
            return new ClassBrowseNew().GetListCheckList(ID);
        }

        [WebMethod]
        public static List<String[]> GetTPMCodeRegister(string TPMCode)
        {
            return new ClassBrowseNew().GetTPMCodeRegister(TPMCode);
        }

        [WebMethod]
        public static List<String[]> GetListMaintenanceCheckListMst()
        {
            return new ClassBrowseNew().GetListMaintenanceCheckListMst();
        }

        [WebMethod]
        public static List<String[]> GetListSubCheckListMaintenance(string ID)
        {
            return new ClassBrowseNew().GetListSubCheckListMaintenance(ID);
        }

        [WebMethod]
        public static List<String[]> GetListRoomMaster(string Type)
        {
            return new ClassBrowseNew().GetListRoomMaster(Type);
        }

        [WebMethod]
        public static List<String[]> GetListMainEquipment(string Code)
        {
            return new ClassBrowseNew().GetListMainEquipment(Code);
        }

        [WebMethod]
        public static List<String[]> GetListGroup(string MainEqID)
        {
            return new ClassBrowseNew().GetListGroup(MainEqID);
        }

        [WebMethod]
        public static List<String[]> GetListEquipment(string MainGroupID)
        {
            return new ClassBrowseNew().GetListEquipment(MainGroupID);
        }

        [WebMethod]
        public static List<String[]> GetListEquipmentRecordStart(string MainGroupID)
        {
            return new ClassBrowseNew().GetListEquipmentRecordStart(MainGroupID);
        }

        [WebMethod]
        public static List<String[]> GetListEquipmentCheckList(string EquipmentID)
        {
            return new ClassBrowseNew().GetListEquipmentCheckList(EquipmentID);
        }

        [WebMethod]
        public static List<String[]> GetListEquipmentReason(string EquipmentID)
        {
            return new ClassBrowseNew().GetListEquipmentReason(EquipmentID);
        }

        [WebMethod]
        public static List<String[]> GetListEquipmentWorkingDay(string EquipmentID)
        {
            return new ClassBrowseNew().GetListEquipmentWorkingDay(EquipmentID);
        }

        [WebMethod]
        public static List<String[]> GetListCompressor(string cust_num_site)
        {
            return new ClassBrowseNew().GetListCompressor(cust_num_site);
        }

        [WebMethod]
        public static List<String[]> GetListCompressorDetail(string ID_Compressor, string TPMCode)
        {
            return new ClassBrowseNew().GetListCompressorDetail(ID_Compressor, TPMCode);
        }

        [WebMethod]
        public static List<String[]> GetListGroupCompressorDetail()
        {
            return new ClassBrowseNew().GetListGroupCompressorDetail();
        }

        [WebMethod]
        public static List<String[]> GetListCompressorSet(string Cust_site)
        {
            return new ClassBrowseNew().GetListCompressorSet(Cust_site);
        }

        [WebMethod]
        public static List<String[]> GetListCompressorSetDetail(string Cust_site)
        {
            return new ClassBrowseNew().GetListCompressorSetDetail(Cust_site);
        }

        [WebMethod]
        public static List<String[]> GetListRoom(string ID, string Packge_id)
        {
            return new ClassBrowseNew().GetListRoom(ID, Packge_id);
        }

        [WebMethod]
        public static List<String[]> GetMachineDetail(string TPMCode)
        {
            return new ClassBrowseNew().GetMachineDetail(TPMCode);
        }

        [WebMethod]
        public static List<String[]> GetLineConfigHeader()
        {
            return new ClassBrowseNew().GetLineConfigHeader();
        }

        [WebMethod]
        public static List<String[]> GetLineConfigDetail(string Header_ID)
        {
            return new ClassBrowseNew().GetLineConfigDetail(Header_ID);
        }

        [WebMethod]
        public static List<String[]> GetServiceUser()
        {
            return new ClassBrowseNew().GetServiceUser();
        }

        [WebMethod]
        public static List<String[]> GetServiceTeam()
        {
            return new ClassBrowseNew().GetServiceTeam();
        }

        [WebMethod]
        public static List<String[]> GetCustomer_inside_IssueList()
        {
            return new ClassBrowseNew().GetCustomer_inside_IssueList();
        }

        [WebMethod]
        public static List<String[]> GetServiceTeamMember(String Team_id)
        {
            return new ClassBrowseNew().GetServiceTeamMember(Team_id);
        }

        [WebMethod]
        public static List<String[]> SP_TPM_Service_Team_Member_NonUser_Select(String Team_id)
        {
            return new ClassBrowseNew().SP_TPM_Service_Team_Member_NonUser_Select(Team_id);
        }

        [WebMethod]
        public static List<String[]> GetMonitoring_Task()
        {
            return new ClassBrowseNew().GetMonitoring_Task();
        }

        [WebMethod]
        public static List<String[]> GetIssueList(string Status, string TPMCode, string ID, string IssueType)
        {
            return new ClassBrowseNew().GetIssueList(Status, TPMCode, ID, IssueType);
        }

        [WebMethod]
        public static List<String[]> GetIssueHoldReason()
        {
            return new ClassBrowseNew().GetIssueHoldReason();
        }

        [WebMethod]
        public static List<String[]> GetCustomerSiteMonitoringList(string BrowseType)
        {
            return new ClassBrowseNew().GetCustomerSiteMonitoringList(BrowseType);
        }

        [WebMethod]
        public static List<String[]> GetMonitoringTaskDetail(string BrowseType, string cust_site)
        {
            return new ClassBrowseNew().GetMonitoringTaskDetail(BrowseType, cust_site);
        }

        [WebMethod]
        public static List<ArrayList> GetLoginTPM(string user, string pass)
        {
            return new ClassBrowseNew().GetLoginTPM(user, pass);
        }

        [WebMethod]
        public static List<ArrayList> GetUserPushLine(string custsite)
        {
            return new ClassBrowseNew().GetUserPushLine(custsite);
        }

        [WebMethod]
        public static List<ArrayList> GetUserPushLineOwner(string custsite)
        {
            return new ClassBrowseNew().GetUserPushLineOwner(custsite);
        }

        [WebMethod]
        public static List<ArrayList> GetListAwaitAssign()
        {
            return new ClassBrowseNew().GetListAwaitAssign();
        }

        [WebMethod]
        public static List<ArrayList> GetListAwaitAssign_New()
        {
            return new ClassBrowseNew().GetListAwaitAssign_New();
        }


        [WebMethod]
        public static List<ArrayList> GetListAssignMyTask()
        {
            return new ClassBrowseNew().GetListAssignMyTask();
        }

        [WebMethod]
        public static List<ArrayList> GetListAssignMyTask_New()
        {
            return new ClassBrowseNew().GetListAssignMyTask_New();
        }

        [WebMethod]
        public static List<ArrayList> GetListRegisterTPM(string cust_site)
        {
            return new ClassBrowseNew().GetListRegisterTPM(cust_site);
        }

        [WebMethod]
        public static List<ArrayList> GetListSchedule(string cust_num)
        {
            return new ClassBrowseNew().GetListSchedule(cust_num);
        }

        [WebMethod]
        public static List<ArrayList> GetCheckDairyReport()
        {
            return new ClassBrowseNew().GetCheckDairyReport();
        }

        [WebMethod]
        public static List<ArrayList> GetCheckDairyReportYRQty(string cust_site)
        {
            return new ClassBrowseNew().GetCheckDairyReportYRQty(cust_site);
        }

        [WebMethod]
        public static List<ArrayList> GetListMonitorTPMCode()
        {
            return new ClassBrowseNew().GetListMonitorTPMCode();
        }

        [WebMethod]
        public static List<ArrayList> GetDetailMonitorTPMCode(string cust_site)
        {
            return new ClassBrowseNew().GetDetailMonitorTPMCode(cust_site);
        }

        [WebMethod]
        public static List<ArrayList> GetReportMonitorTimeChecked()
        {
            return new ClassBrowseNew().GetReportMonitorTimeChecked();
        }

        [WebMethod]
        public static List<ArrayList> GetReportMonitorChecked()
        {
            return new ClassBrowseNew().GetReportMonitorChecked();
        }

        [WebMethod]
        public static List<ArrayList> GetReportMonitorTransactionDetail()
        {
            return new ClassBrowseNew().GetReportMonitorTransactionDetail();
        }

        [WebMethod]
        public static List<String[]> GetListCompressorDetailWorkingDay(string TPMCode)
        {
            return new ClassBrowseNew().GetListCompressorDetailWorkingDay(TPMCode);
        }

        [WebMethod]
        public static List<ArrayList> GetCustomerReport(string ID, string cust_num, string cust_site)
        {
            return new ClassBrowseNew().GetCustomerReport(ID, cust_num, cust_site);
        }

        [WebMethod]
        public static List<ArrayList> GetCustomerReportDetail(string ID)
        {
            return new ClassBrowseNew().GetCustomerReportDetail(ID);
        }

        [WebMethod]
        public static List<ArrayList> GetListCheckListForCustomerReport(string Report_ID)
        {
            return new ClassBrowseNew().GetListCheckListForCustomerReport(Report_ID);
        }

        [WebMethod]
        public static List<ArrayList> GetListGuideLocation()
        {
            return new ClassBrowseNew().GetListGuideLocation();
        }

        [WebMethod]
        public static List<ArrayList> GetListGuideMain(string IDType, string Keyword)
        {
            return new ClassBrowseNew().GetListGuideMain(IDType, Keyword);
        }

        [WebMethod]
        public static List<ArrayList> GetListGuideStep(string IDMain)
        {
            return new ClassBrowseNew().GetListGuideStep(IDMain);
        }

        [WebMethod]
        public static List<ArrayList> GetListGuideStepDetail(string IDStep)
        {
            return new ClassBrowseNew().GetListGuideStepDetail(IDStep);
        }

    }
}