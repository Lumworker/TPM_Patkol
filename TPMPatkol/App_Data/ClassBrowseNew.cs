using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;
using System.Globalization;
using System.Text;
using System.Collections.Generic;
using System.Collections;

namespace MobileTask.AppCode
{
    public class ClassBrowseNew
    {
        //public static String conTPMClound = "Data Source=172.25.238.1; Initial Catalog=TPM_Portal;Persist Security Info=True;User ID=sa;Password=@Patkol.com; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conTPMClound = "Data Source=203.151.62.138; Initial Catalog=TPM_Portal;Persist Security Info=True;User ID=sa;Password=@Patkol.com; Connect Timeout=0; pooling=true; Max Pool Size=50000";


        public String GetUser()
        {
            var UserDomain = HttpContext.Current.Request.LogonUserIdentity.Name;
            UserDomain = UserDomain.Replace("PATKOL\\", "");
            return UserDomain;
        }

        public List<ArrayList> GetListUser(string ID)
        {
            List<ArrayList> GetListUser = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Username] ,[Password] ,[Name] ,[Email] ,[LineID] ,[Gendor] ,[Type] ,[RoleEmp] FROM [dbo].[TB_Username]";
                if (ID != "")
                {
                    sql += " WHERE [ID] = '" + ID + "'";
                }
                sql += " ORDER BY [Type]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListUser.Add(get);
                        }
                    }
                }
            }
            return GetListUser;
        }

        public List<String[]> GetUserTPMPatkol(string Customer_Code)
        {
            List<String[]> GetEmployee = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [Username] ,[Password] ,[Name] ,[Email] ,[LineID] ,[Gendor] ,[Type],tcm.[Customer],tcm.[Customer_Site] FROM [dbo].[TB_Username] tu LEFT JOIN [dbo].[TB_Customer_Member] tcm ON tcm.[Users] = tu.[Username] AND tcm.[Customer] = '" + Customer_Code + "'";
                //sql += "  WHERE tcm.[Customer_Site] is null";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getid = new String[4];
                            getid[0] = reader["Username"].ToString().Trim();
                            getid[1] = reader["Name"].ToString().Trim();
                            getid[2] = reader["Customer"].ToString().Trim();
                            getid[3] = reader["Customer_Site"].ToString().Trim();

                            GetEmployee.Add(getid);
                        }
                    }
                }
            }
            return GetEmployee;
        }

        public void SP_TPM_User(int ID, string Username, string Password, string Name, string Email, string Gendor, string Type)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_User", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Username", Username);
            cmd.Parameters.AddWithValue("Password", Password);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Email", Email);
            cmd.Parameters.AddWithValue("Gendor", Gendor);
            cmd.Parameters.AddWithValue("Type", Type);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public string SP_TPM_Code_Insert(string TMPCode, string proj_num, string job_num, string lot_num, string serial_num, int TypeTPM, string CodeTypeTPM, string UpdateBy)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Code_Insert", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("TMPCode", TMPCode);
            cmd.Parameters.AddWithValue("proj_num", proj_num);
            cmd.Parameters.AddWithValue("job_num", job_num);
            cmd.Parameters.AddWithValue("lot_num", lot_num);
            cmd.Parameters.AddWithValue("serial_num", serial_num);
            cmd.Parameters.AddWithValue("CreateBy", UpdateBy);
            cmd.Parameters.AddWithValue("UpdateBy", UpdateBy);
            cmd.Parameters.AddWithValue("TypeTPM", TypeTPM);
            cmd.Parameters.AddWithValue("CodeTypeTPM", CodeTypeTPM);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["MaxNumber"].ToString(); }
            connect.Close();
            return returnData;
        }

        public void SP_TPM_Code_Insert_CustomerSite(string TMPCode, string cust_num_site, string Status, string effect_date, string expire_date, string StatusWork)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Code_Insert_CustomerSite", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("TMPCode", TMPCode);
            cmd.Parameters.AddWithValue("cust_num_site", cust_num_site);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("effect_date", effect_date);
            cmd.Parameters.AddWithValue("expire_date", expire_date);
            cmd.Parameters.AddWithValue("StatusWork", StatusWork);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public string SP_TPM_Code_Lot(int LotID, string StartTPMCode, string EndTPMCode)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Code_Lot", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("LotID", LotID);
            cmd.Parameters.AddWithValue("StartTPMCode", StartTPMCode);
            cmd.Parameters.AddWithValue("EndTPMCode", EndTPMCode);
            cmd.Parameters.AddWithValue("CreateBy", GetUser());
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public void SP_TPM_Customer(string cust_num/*, string cust_name*/, string cust_address, string cust_tel, string cust_mobile, string cust_fax, string cust_logo)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Customer", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("cust_num", cust_num);
            //cmd.Parameters.AddWithValue("cust_name", cust_name);
            cmd.Parameters.AddWithValue("cust_address", cust_address);
            cmd.Parameters.AddWithValue("cust_tel", cust_tel);
            cmd.Parameters.AddWithValue("cust_mobile", cust_mobile);
            cmd.Parameters.AddWithValue("cust_fax", cust_fax);
            cmd.Parameters.AddWithValue("cust_logo", cust_logo);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public string SP_TPM_Customer_Stie(int cust_num_site, string cust_num, string cust_site_name, string cust_address, string cust_tel, string cust_mobile, string cust_fax, string cust_latitude, string cust_longitude, string Status)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Customer_Stie", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("cust_num_site", cust_num_site);
            cmd.Parameters.AddWithValue("cust_num", cust_num);
            cmd.Parameters.AddWithValue("cust_site_name", cust_site_name);
            cmd.Parameters.AddWithValue("cust_address", cust_address);
            cmd.Parameters.AddWithValue("cust_tel", cust_tel);
            cmd.Parameters.AddWithValue("cust_mobile", cust_mobile);
            cmd.Parameters.AddWithValue("cust_fax", cust_fax);
            cmd.Parameters.AddWithValue("cust_latitude", cust_latitude);
            cmd.Parameters.AddWithValue("cust_longitude", cust_longitude);
            cmd.Parameters.AddWithValue("Status", Status);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public void SP_TPM_Customer_Stie_WorkingDay(int cust_num_site, int Monday, int Tuesday, int Wednesday, int Thursday, int Friday, int Saturday, int Sunday)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Customer_Stie_WorkingDay", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("cust_num_site", cust_num_site);
            cmd.Parameters.AddWithValue("Monday", Monday);
            cmd.Parameters.AddWithValue("Tuesday", Tuesday);
            cmd.Parameters.AddWithValue("Wednesday", Wednesday);
            cmd.Parameters.AddWithValue("Thursday", Thursday);
            cmd.Parameters.AddWithValue("Friday", Friday);
            cmd.Parameters.AddWithValue("Saturday", Saturday);
            cmd.Parameters.AddWithValue("Sunday", Sunday);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public string SP_TPM_Customer_Member(int ID, string Users, string Customer, int Customer_Site, string Status, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Customer_Member", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Users", Users);
            cmd.Parameters.AddWithValue("Customer", Customer);
            cmd.Parameters.AddWithValue("Customer_Site", Customer_Site);
            //cmd.Parameters.AddWithValue("Machine", Machine);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public void SP_TPM_MaintenanceSystem(string TPMCode, int List_id, string Status)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_MaintenanceSystem", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("TPMCode", TPMCode);
            cmd.Parameters.AddWithValue("List_id", List_id);
            cmd.Parameters.AddWithValue("Status", Status);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }


        public string SP_TPM_Room_Master(int ID, string Code, string Name, string Status, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Room_Master", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Code", Code);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Machine_Main_Equipment(int ID, string Code, string Name, string Status, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Machine_Main_Equipment", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Code", Code);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Machine_Group(int ID, int Machine_MainID, string Code, string Name, string Status, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Machine_Group", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Machine_MainID", Machine_MainID);
            cmd.Parameters.AddWithValue("Code", Code);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Machine_Equipment(int ID, int Machine_GroupID, string Code, string Name, string Status, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Machine_Equipment", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Machine_GroupID", Machine_GroupID);
            cmd.Parameters.AddWithValue("Code", Code);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Machine_Equip_Checklist(int ID, int Machine_EquipID, string CheckID, string Status)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Machine_Equip_Checklist", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Machine_EquipID", Machine_EquipID);
            cmd.Parameters.AddWithValue("CheckID", CheckID);
            cmd.Parameters.AddWithValue("Status", Status);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }


        public string SP_TPM_Maintenance_CheckList(int ID, string List_Name, string Picture, string Status, string QuestionType, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Maintenance_CheckList", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("List_Name", List_Name);
            cmd.Parameters.AddWithValue("Picture", Picture);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("QuestionType", QuestionType);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Maintenance_CheckList_V2(int ID, string List_Name, string Picture, string Status, string QuestionType, string Yellow_Criteria, string Red_Criteria, string Criteria, int AllowEntry, int ResetRecord, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Maintenance_CheckList_V2", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("List_Name", List_Name);
            cmd.Parameters.AddWithValue("Picture", Picture);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("QuestionType", QuestionType);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            cmd.Parameters.AddWithValue("Yellow_Criteria", Yellow_Criteria);
            cmd.Parameters.AddWithValue("Red_Criteria", Red_Criteria);
            cmd.Parameters.AddWithValue("Criteria", Criteria);
            cmd.Parameters.AddWithValue("AllowEntry", AllowEntry);
            cmd.Parameters.AddWithValue("ResetRecord", ResetRecord);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Sub_CheckList_Maintenance(int ID, int List_ID, int List_No, string List_Name, int Priority, int Report_Status, string CreateBy, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Sub_CheckList_Maintenance", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("List_ID", List_ID);
            cmd.Parameters.AddWithValue("List_No", List_No);
            cmd.Parameters.AddWithValue("List_Name", List_Name);
            cmd.Parameters.AddWithValue("CreateBy", CreateBy);
            cmd.Parameters.AddWithValue("Priority", Priority);
            cmd.Parameters.AddWithValue("Report_Status", Report_Status);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Compressor(int ID, string Type, string Name, int cust_num_site, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Compressor", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Type", Type);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("cust_num_site", cust_num_site);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }


        public string SP_TPM_Compressor_Detail_insert_V2(int ID, int Compressor_ID, int Group_ID, int Equipment_ID, string CompressorSuffix, string QuestionOther, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Compressor_Detail_insert_V2", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Compressor_ID", Compressor_ID);
            cmd.Parameters.AddWithValue("Group_ID", Group_ID);
            cmd.Parameters.AddWithValue("Equipment_ID", Equipment_ID);
            cmd.Parameters.AddWithValue("CompressorSuffix", CompressorSuffix);
            cmd.Parameters.AddWithValue("QuestionOther", QuestionOther);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Compressor_Detail_insert_V3(int ID, int Compressor_ID, int Group_ID, int Equipment_ID, string CompressorSuffix, string QuestionOther, int RecordStart, double Yellow_Criteria, double Red_Criteria, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Compressor_Detail_insert_V3", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Compressor_ID", Compressor_ID);
            cmd.Parameters.AddWithValue("Group_ID", Group_ID);
            cmd.Parameters.AddWithValue("Equipment_ID", Equipment_ID);
            cmd.Parameters.AddWithValue("CompressorSuffix", CompressorSuffix);
            cmd.Parameters.AddWithValue("QuestionOther", QuestionOther);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            cmd.Parameters.AddWithValue("RecordStart", RecordStart);
            cmd.Parameters.AddWithValue("Yellow_Criteria", Yellow_Criteria);
            cmd.Parameters.AddWithValue("Red_Criteria", Red_Criteria);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Compressor_Set_insert(int Package_ID, int Compressor_ID, string Name, string Cust_site, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Compressor_Set_insert", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Package_ID", Package_ID);
            cmd.Parameters.AddWithValue("Compressor_ID", Compressor_ID);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Cust_site", Cust_site);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Room_insert(int ID, int PakageID, int RoomID, string RoomNo, string RoomName, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Room_insert", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("PakageID", PakageID);
            cmd.Parameters.AddWithValue("RoomID", RoomID);
            cmd.Parameters.AddWithValue("RoomNo", RoomNo);
            cmd.Parameters.AddWithValue("RoomName", RoomName);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Machine_insert_V2(int ID, int RoomID, int Machine_MainID, int Machine_GroupID, int Machine_EquipmentID, string TPMCode, string MachineSuffix, string QuestionOther, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Machine_insert_V2", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("RoomID", RoomID);
            cmd.Parameters.AddWithValue("Machine_MainID", Machine_MainID);
            cmd.Parameters.AddWithValue("Machine_GroupID", Machine_GroupID);
            cmd.Parameters.AddWithValue("Machine_EquipmentID", Machine_EquipmentID);
            cmd.Parameters.AddWithValue("TPMCode", TPMCode);
            cmd.Parameters.AddWithValue("MachineSuffix", MachineSuffix);
            cmd.Parameters.AddWithValue("QuestionOther", QuestionOther);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Machine_insert_V3(int ID, int RoomID, int Machine_MainID, int Machine_GroupID, int Machine_EquipmentID, string TPMCode, string MachineSuffix, string QuestionOther, int RecordStart, double Yellow_Criteria, double Red_Criteria, string Status_Work)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Machine_insert_V3", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("RoomID", RoomID);
            cmd.Parameters.AddWithValue("Machine_MainID", Machine_MainID);
            cmd.Parameters.AddWithValue("Machine_GroupID", Machine_GroupID);
            cmd.Parameters.AddWithValue("Machine_EquipmentID", Machine_EquipmentID);
            cmd.Parameters.AddWithValue("TPMCode", TPMCode);
            cmd.Parameters.AddWithValue("MachineSuffix", MachineSuffix);
            cmd.Parameters.AddWithValue("QuestionOther", QuestionOther);
            cmd.Parameters.AddWithValue("Status_Work", Status_Work);
            cmd.Parameters.AddWithValue("RecordStart", RecordStart);
            cmd.Parameters.AddWithValue("Yellow_Criteria", Yellow_Criteria);
            cmd.Parameters.AddWithValue("Red_Criteria", Red_Criteria);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public string SP_TPM_Machine_Equip_Reason(int ID, int Equipment_ID, string Reason, int Seq, string StatusReason, string Status)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Machine_Equip_Reason", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Equipment_ID", Equipment_ID);
            cmd.Parameters.AddWithValue("Reason", Reason);
            cmd.Parameters.AddWithValue("Seq", Seq);
            cmd.Parameters.AddWithValue("StatusReason", StatusReason);
            cmd.Parameters.AddWithValue("Status", Status);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public void SP_TPM_Machine_Equip_WorkingDay(int Equipment_ID, int Monday, int Tuesday, int Wednesday, int Thursday, int Friday, int Saturday, int Sunday)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Machine_Equip_WorkingDay", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Equipment_ID", Equipment_ID);
            cmd.Parameters.AddWithValue("Monday", Monday);
            cmd.Parameters.AddWithValue("Tuesday", Tuesday);
            cmd.Parameters.AddWithValue("Wednesday", Wednesday);
            cmd.Parameters.AddWithValue("Thursday", Thursday);
            cmd.Parameters.AddWithValue("Friday", Friday);
            cmd.Parameters.AddWithValue("Saturday", Saturday);
            cmd.Parameters.AddWithValue("Sunday", Sunday);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_TPM_Compressor_Detail_RegisterTPMCode(int ID, string TPMCode)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Compressor_Detail_RegisterTPMCode", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("TPMCode", TPMCode);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_TPM_LineConfig_Header(int ID, string Msg_Name)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_LineConfig_Header", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Msg_Name", Msg_Name);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_TPM_LineConfig(int ID, int Seq, string msg_type, string Msg, int Header_ID)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_LineConfig", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Seq", Seq);
            cmd.Parameters.AddWithValue("msg_type", msg_type);
            cmd.Parameters.AddWithValue("Msg", Msg);
            cmd.Parameters.AddWithValue("Header_ID", Header_ID);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_TPM_Service_Team(int ID, string Team_Name)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Service_Team", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Team_Name", Team_Name);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_TPM_Service_Team_Member(int Service_ID, string Username, string Type)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Service_Team_Member", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Service_ID", Service_ID);
            cmd.Parameters.AddWithValue("Username", Username);
            cmd.Parameters.AddWithValue("Type", Type);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }


        public void SP_TPM_Service_User(string Username, string Name, string Lastname, string Role, string Status, string Type)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Service_User", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Username", Username);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Lastname", Lastname);
            cmd.Parameters.AddWithValue("Role", Role);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("Type", Type);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_IssueList_Update(string Username, string TPMCode, string Acting, string Status, string DueDate, string Detail, string Picture, string HoldReason, string FixStatus)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_IssueList_Update", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Username", Username);
            cmd.Parameters.AddWithValue("TPMCode", TPMCode);
            cmd.Parameters.AddWithValue("Acting", Acting);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("DueDate", DueDate);
            cmd.Parameters.AddWithValue("Detail", Detail);
            cmd.Parameters.AddWithValue("Picture", Picture);
            cmd.Parameters.AddWithValue("HoldReason", HoldReason);
            cmd.Parameters.AddWithValue("FixStatus", FixStatus);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_IssueList_UpdateV2(int ID, string Username, string TPMCode, string Acting, string Status, string DueDate, string Detail, string Picture, string HoldReason, string FixStatus)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_IssueList_UpdateV2", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Username", Username);
            cmd.Parameters.AddWithValue("TPMCode", TPMCode);
            cmd.Parameters.AddWithValue("Acting", Acting);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("DueDate", DueDate);
            cmd.Parameters.AddWithValue("Detail", Detail);
            cmd.Parameters.AddWithValue("Picture", Picture);
            cmd.Parameters.AddWithValue("HoldReason", HoldReason);
            cmd.Parameters.AddWithValue("FixStatus", FixStatus);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_IssueList_UpdateV3(int ID, string Username, string TPMCode, string Acting, string Status, string DueDate, string Detail, string Picture, string HoldReason, string FixStatus, string IssueType)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_IssueList_UpdateV3", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Username", Username);
            cmd.Parameters.AddWithValue("TPMCode", TPMCode);
            cmd.Parameters.AddWithValue("Acting", Acting);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("DueDate", DueDate);
            cmd.Parameters.AddWithValue("Detail", Detail);
            cmd.Parameters.AddWithValue("Picture", Picture);
            cmd.Parameters.AddWithValue("HoldReason", HoldReason);
            cmd.Parameters.AddWithValue("FixStatus", FixStatus);
            cmd.Parameters.AddWithValue("IssueType", IssueType);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_Appointment_Assign(int appNo, int team_ID, string working_date, string plan_starttime, string plan_endtime, string UserName)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_Appointment_Assign", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("appNo", appNo);
            cmd.Parameters.AddWithValue("team_ID", team_ID);
            cmd.Parameters.AddWithValue("working_date", working_date);
            cmd.Parameters.AddWithValue("plan_starttime", plan_starttime);
            cmd.Parameters.AddWithValue("plan_endtime", plan_endtime);
            cmd.Parameters.AddWithValue("UserName", UserName);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_Appointment_Assign_Trans(int appNo, int cust_site, int team_ID, string working_date, string plan_starttime, string plan_endtime, string UserName, string AppName)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_Appointment_Trans", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("appNo", appNo);
            cmd.Parameters.AddWithValue("cust_site", cust_site);
            cmd.Parameters.AddWithValue("team_ID", team_ID);
            cmd.Parameters.AddWithValue("working_date", working_date);
            cmd.Parameters.AddWithValue("plan_starttime", plan_starttime);
            cmd.Parameters.AddWithValue("plan_endtime", plan_endtime);
            cmd.Parameters.AddWithValue("CreateBy", UserName);
            cmd.Parameters.AddWithValue("AppName", AppName);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_Appointment_Trans_Assign_Process(int appNo, string UserName)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_Appointment_Trans_Assign", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("appNo", appNo);
            cmd.Parameters.AddWithValue("CreateBy", UserName);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }


        public void SP_Appointment_CheckIn(int appNo, string latitude, string longitude, string UserName)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_Appointment_CheckIn", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("appNo", appNo);
            cmd.Parameters.AddWithValue("latitude", latitude);
            cmd.Parameters.AddWithValue("longitude", longitude);
            cmd.Parameters.AddWithValue("UserName", UserName);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_Appointment_Trans_CheckIn(int appNo, string latitude, string longitude, string UserName)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_Appointment_Trans_CheckIn", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("appNo", appNo);
            cmd.Parameters.AddWithValue("latitude", latitude);
            cmd.Parameters.AddWithValue("longitude", longitude);
            cmd.Parameters.AddWithValue("CreateBy", UserName);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public string SP_Schedule(int ID, string cust_num_site, string Schedule, string Type)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_Schedule", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("cust_num_site", cust_num_site);
            cmd.Parameters.AddWithValue("Schedule", Schedule);
            cmd.Parameters.AddWithValue("Type", Type);
            connect.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public void SP_TPM_Code_WorkingDay(string TPMCode, int Monday, int Tuesday, int Wednesday, int Thursday, int Friday, int Saturday, int Sunday)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_TPM_Code_WorkingDay", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("TPMCode", TPMCode);
            cmd.Parameters.AddWithValue("Monday", Monday);
            cmd.Parameters.AddWithValue("Tuesday", Tuesday);
            cmd.Parameters.AddWithValue("Wednesday", Wednesday);
            cmd.Parameters.AddWithValue("Thursday", Thursday);
            cmd.Parameters.AddWithValue("Friday", Friday);
            cmd.Parameters.AddWithValue("Saturday", Saturday);
            cmd.Parameters.AddWithValue("Sunday", Sunday);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public string SP_Customer_Report(int ID, int cust_site, string TypeReport, string ReportName, string Username)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_Customer_Report", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("cust_site", cust_site);
            cmd.Parameters.AddWithValue("TypeReport", TypeReport);
            cmd.Parameters.AddWithValue("ReportName", ReportName);
            cmd.Parameters.AddWithValue("Username", Username);
            connect.Open();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

        public void SP_Customer_Report_Detail(int ID, int Cust_Report_ID, int ListLevel, int CheckList_ID, string HeaderName, string TypeDetail, string Username, string Status)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_Customer_Report_Detail", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Cust_Report_ID", Cust_Report_ID);
            cmd.Parameters.AddWithValue("ListLevel", ListLevel);
            cmd.Parameters.AddWithValue("CheckList_ID", CheckList_ID);
            cmd.Parameters.AddWithValue("HeaderName", HeaderName);
            cmd.Parameters.AddWithValue("TypeDetail", TypeDetail);
            cmd.Parameters.AddWithValue("Username", Username);
            cmd.Parameters.AddWithValue("Status", Status);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_HelpTool_Customize_Type(int ID, string Name, string Type_Location)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_HelpTool_Customize_Type", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Name", Name);
            cmd.Parameters.AddWithValue("Type_Location", Type_Location);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_HelpTool_Customize_Main_Guide(int ID, string Name_Guide, int Location_ID)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_HelpTool_Customize_Main_Guide", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Name_Guide", Name_Guide);
            cmd.Parameters.AddWithValue("Location_ID", Location_ID);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public void SP_HelpTool_Customize_Step(int ID, int Main_ID, int StepNo, string StepName)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_HelpTool_Customize_Step", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Main_ID", Main_ID);
            cmd.Parameters.AddWithValue("StepNo", StepNo);
            cmd.Parameters.AddWithValue("StepName", StepName);
            connect.Open();
            cmd.ExecuteNonQuery();
            connect.Close();
        }

        public string SP_HelpTool_Customize_Step_Detail(int ID, int Step_ID, int ListNo, string IMG_Path, string Description)
        {
            SqlConnection connect = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand("SP_HelpTool_Customize_Step_Detail", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Step_ID", Step_ID);
            cmd.Parameters.AddWithValue("ListNo", ListNo);
            cmd.Parameters.AddWithValue("IMG_Path", IMG_Path);
            cmd.Parameters.AddWithValue("Description", Description);
            connect.Open();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read()) { returnData = rs["ID"].ToString(); }
            connect.Close();
            return returnData;
        }

   

        public String[] GetTPMCode(string TPMCode)
        {
            String[] getdata = new String[7];
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [TMPCode],[proj_num],[job_num],[lot_num],[serial_num],[imgQRCode],[TypeTPM] FROM [dbo].[TB_TPM_Code] WHERE [TMPCode] = '" + TPMCode + "'";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            getdata[0] = reader["TMPCode"].ToString().Trim();
                            getdata[1] = reader["proj_num"].ToString().Trim();
                            getdata[2] = reader["job_num"].ToString().Trim();
                            getdata[3] = reader["lot_num"].ToString().Trim();
                            getdata[4] = reader["serial_num"].ToString().Trim();
                            getdata[5] = reader["imgQRCode"].ToString().Trim();
                            getdata[6] = reader["TypeTPM"].ToString().Trim();
                        }
                    }
                }
            }
            return getdata;
        }

        public List<String[]> GetTPMCodeRegister(string TPMCode)
        {
            List<String[]> GetTPMCodeRegister = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [MachineMainCode],[TPMCode] ,[Status] ,[proj_num] ,[job_num] ,[lot_num] ,[serial_num] ,[imgQRCode] ,[CreateBy] ,[UpdateBy] ,[TypeTPM] ,[cust_num],[cust_name] ,[cust_num_site],[cust_site_name] ,[effect_date] ,[expire_date] ,[Machine_MainID] ,[Machine_GroupID] ,[Machine_EquipmentID] ,[RoomID] ,[Package_ID] FROM [dbo].[VW_TPMCode_Register]  WHERE [TPMCode] = '" + TPMCode + "'";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[19];
                            getdata[0] = reader["TPMCode"].ToString().Trim();
                            getdata[1] = reader["Status"].ToString().Trim();
                            getdata[2] = reader["proj_num"].ToString().Trim();
                            getdata[3] = reader["job_num"].ToString().Trim();
                            getdata[4] = reader["lot_num"].ToString().Trim();
                            getdata[5] = reader["serial_num"].ToString().Trim();
                            getdata[6] = reader["TypeTPM"].ToString().Trim();
                            getdata[7] = reader["cust_num"].ToString().Trim();
                            getdata[8] = reader["cust_num_site"].ToString().Trim();
                            getdata[9] = "" + reader["effect_date"].ToString().Trim();
                            getdata[10] = "" + reader["expire_date"].ToString().Trim();
                            getdata[11] = reader["Machine_MainID"].ToString().Trim();
                            getdata[12] = reader["Machine_GroupID"].ToString().Trim();
                            getdata[13] = reader["Machine_EquipmentID"].ToString().Trim();
                            getdata[14] = reader["RoomID"].ToString().Trim();
                            getdata[15] = reader["Package_ID"].ToString().Trim();
                            getdata[16] = reader["cust_name"].ToString().Trim();
                            getdata[17] = reader["cust_site_name"].ToString().Trim();
                            getdata[18] = reader["MachineMainCode"].ToString().Trim();
                            GetTPMCodeRegister.Add(getdata);
                        }
                    }
                }
            }
            return GetTPMCodeRegister;
        }

        public List<String[]> GetLotTPMCode(string LotID, string Search)
        {
            List<String[]> getdata = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [LotID],[StartTPMCode],[EndTPMCode],[CreateDate] ,[CreateBy] FROM [dbo].[TB_TPM_Lot] ";

                if (LotID != "") { sql += " WHERE [LotID] = '" + LotID + "' "; }
                if (Search != "") { sql += " WHERE ([LotID] LIKE ('%" + Search + "%') OR [StartTPMCode] LIKE ('%" + Search + "%') OR [EndTPMCode] LIKE ('%" + Search + "%')) "; }

                sql += " ORDER BY [LotID]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] GETString = new String[5];
                            GETString[0] = reader["LotID"].ToString().Trim();
                            GETString[1] = reader["StartTPMCode"].ToString().Trim();
                            GETString[2] = reader["EndTPMCode"].ToString().Trim();
                            GETString[3] = reader["CreateDate"].ToString().Trim();
                            GETString[4] = reader["CreateBy"].ToString().Trim();


                            getdata.Add(GETString);
                        }
                    }
                }
            }
            return getdata;
        }

        public List<String[]> GetListCustomer(string cust_num, string search)
        {
            List<String[]> GetCustomer = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT TOP(200) [cust_num],[cust_name],[cust_address],[cust_tel],[cust_mobile],[cust_fax],[cust_logo] FROM [dbo].[TB_Customer] ";
                if (cust_num != "") { sql += " WHERE cust_num = '" + cust_num + "'"; }
                else if (search != "") { sql += " WHERE cust_num LIKE ('%" + search + "%') OR [cust_name] LIKE ('%" + search + "%')"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[7];

                            getdata[0] = reader["cust_num"].ToString().Trim();
                            getdata[1] = reader["cust_name"].ToString().Trim();
                            getdata[2] = reader["cust_address"].ToString().Trim();
                            getdata[3] = reader["cust_tel"].ToString().Trim();
                            getdata[4] = reader["cust_mobile"].ToString().Trim();
                            getdata[5] = reader["cust_fax"].ToString().Trim();
                            getdata[6] = reader["cust_logo"].ToString().Trim();

                            GetCustomer.Add(getdata);
                        }
                    }
                }
            }
            return GetCustomer;
        }

        public List<String[]> GetListCustomerSite(string cust_num)
        {
            List<String[]> GetCustomer = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_num_site],[cust_num],[cust_site_name],[cust_address],[cust_tel],[cust_mobile],[cust_fax],[Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday] FROM [dbo].[TB_Customer_Site] WHERE [cust_num] = '" + cust_num + "' ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[14];
                            getdata[0] = reader["cust_num_site"].ToString().Trim();
                            getdata[1] = reader["cust_num"].ToString().Trim();
                            getdata[2] = reader["cust_site_name"].ToString().Trim();
                            getdata[3] = reader["cust_address"].ToString().Trim();
                            getdata[4] = reader["cust_tel"].ToString().Trim();
                            getdata[5] = reader["cust_mobile"].ToString().Trim();
                            getdata[6] = reader["cust_fax"].ToString().Trim();
                            getdata[7] = reader["Monday"].ToString().Trim();
                            getdata[8] = reader["Tuesday"].ToString().Trim();
                            getdata[9] = reader["Wednesday"].ToString().Trim();
                            getdata[10] = reader["Thursday"].ToString().Trim();
                            getdata[11] = reader["Friday"].ToString().Trim();
                            getdata[12] = reader["Saturday"].ToString().Trim();
                            getdata[13] = reader["Sunday"].ToString().Trim();
                            GetCustomer.Add(getdata);
                        }
                    }
                }
            }
            return GetCustomer;
        }

        public List<String[]> GetListMachineMember(string TPMCode)
        {
            List<String[]> GetMachineMember = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [TMPCode],[proj_num],[job_num],[lot_num],[serial_num],[imgQRCode],[CreateBy],[UpdateBy],[TypeTPM] FROM [dbo].[TB_TPM_Code]";

                if (TPMCode != "")
                {
                    sql += " WHERE [TMPCode] LIKE ('%" + TPMCode + "%')";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[7];
                            getdata[0] = reader["TMPCode"].ToString().Trim();
                            getdata[1] = reader["proj_num"].ToString().Trim();
                            getdata[2] = reader["job_num"].ToString().Trim();
                            getdata[3] = reader["lot_num"].ToString().Trim();
                            getdata[4] = reader["serial_num"].ToString().Trim();
                            getdata[5] = reader["imgQRCode"].ToString().Trim();
                            getdata[6] = reader["CreateBy"].ToString().Trim();
                            GetMachineMember.Add(getdata);
                        }
                    }
                }
            }
            return GetMachineMember;
        }

        public List<String[]> GetListCustomerMember(string cust_num)
        {
            List<String[]> GetCustomerMember = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT tcm.[ID],tcm.[Users],tcm.[Customer],tcm.[Customer_Site],tcs.[cust_site_name],tcm.[Machine],tcm.[Status] FROM [TPM_Portal].[dbo].[TB_Customer_Member] tcm INNER JOIN [dbo].[TB_Customer_Site] tcs ON tcs.[cust_num_site] = tcm.[Customer_Site] WHERE tcm.[Customer] = '" + cust_num + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[7];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Users"].ToString().Trim();
                            getdata[2] = reader["Customer"].ToString().Trim();
                            getdata[3] = reader["Customer_Site"].ToString().Trim();
                            getdata[4] = reader["Machine"].ToString().Trim();
                            getdata[5] = reader["Status"].ToString().Trim();
                            getdata[6] = reader["cust_site_name"].ToString().Trim();

                            GetCustomerMember.Add(getdata);
                        }
                    }
                }
            }
            return GetCustomerMember;
        }


        public List<String[]> GetListCheckList(string ID)
        {
            List<String[]> GetListCheckList = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "EXEC SP_A_Select_CheckList_Maintenance";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[4];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["List_Name"].ToString().Trim();
                            getdata[2] = reader["Picture"].ToString().Trim();
                            getdata[3] = reader["CheckListValue"].ToString().Trim();

                            GetListCheckList.Add(getdata);
                        }
                    }
                }
            }
            return GetListCheckList;
        }


        public List<String[]> GetListMaintenanceCheckListMst()
        {
            List<String[]> GetListMaintenanceCheckListMst = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = " SELECT [ID] ,[List_Name] ,[Picture] ,[Status],[QuestionType],isnull([Yellow_Criteria],0) as [Yellow_Criteria],isnull([Red_Criteria],0) as [Red_Criteria],isnull([Criteria],'') as [Criteria],[AllowEntry],[ResetRecord] FROM [dbo].[TB_CheckList_Mst]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[10];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["List_Name"].ToString().Trim();
                            getdata[2] = reader["Picture"].ToString().Trim();
                            getdata[3] = reader["Status"].ToString().Trim();
                            getdata[4] = reader["QuestionType"].ToString().Trim();
                            getdata[5] = reader["Yellow_Criteria"].ToString().Trim();
                            getdata[6] = reader["Red_Criteria"].ToString().Trim();
                            getdata[7] = reader["Criteria"].ToString().Trim();
                            getdata[8] = reader["AllowEntry"].ToString().Trim();
                            getdata[9] = reader["ResetRecord"].ToString().Trim();
                            GetListMaintenanceCheckListMst.Add(getdata);
                        }
                    }
                }
            }
            return GetListMaintenanceCheckListMst;
        }

        public List<String[]> GetListSubCheckListMaintenance(string ID)
        {
            List<String[]> GetListCheckList = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "EXEC SP_A_Select_Sub_CheckList_Maintenance '" + ID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[8];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["List_Name"].ToString().Trim();
                            getdata[2] = reader["Picture"].ToString().Trim();
                            getdata[3] = reader["IDChoice"].ToString().Trim();
                            getdata[4] = reader["List_No"].ToString().Trim();
                            getdata[5] = reader["Name_Choice"].ToString().Trim();
                            getdata[6] = reader["Priority"].ToString().Trim();
                            getdata[7] = reader["Report_Status"].ToString().Trim();
                            GetListCheckList.Add(getdata);
                        }
                    }
                }
            }
            return GetListCheckList;
        }

        public List<String[]> GetListRoomMaster(string Type)
        {
            List<String[]> GetListRoomMaster = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Name] ,[Status] ,[Code] FROM [dbo].[TB_Room_Mst] trm ";
                if (Type != "") { sql += " WHERE NOT trm.[ID] IN ( SELECT tr.[RoomID] FROM [dbo].[TB_Room] tr ) "; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[4];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Code"].ToString().Trim();
                            getdata[2] = reader["Name"].ToString().Trim();
                            getdata[3] = reader["Status"].ToString().Trim();
                            GetListRoomMaster.Add(getdata);
                        }
                    }
                }
            }
            return GetListRoomMaster;
        }

        public List<String[]> GetListMainEquipment(string Code)
        {
            List<String[]> GetListMainEquipment = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Code] ,[Name] ,[Status] FROM [dbo].[TB_Machine_Main]";
                if (Code != "") { sql += " WHERE [Code] = '" + Code + "'"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[4];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Code"].ToString().Trim();
                            getdata[2] = reader["Name"].ToString().Trim();
                            getdata[3] = reader["Status"].ToString().Trim();
                            GetListMainEquipment.Add(getdata);
                        }
                    }
                }
            }
            return GetListMainEquipment;
        }

        public List<String[]> GetListGroup(string MainEqID)
        {
            List<String[]> GetListGroup = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Machine_MainID] ,[Name] ,[Status] ,[Code] FROM [dbo].[TB_Machine_Group] ";

                if (MainEqID != "") { sql += " WHERE [Machine_MainID] = '" + MainEqID + "'"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[5];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Code"].ToString().Trim();
                            getdata[2] = reader["Name"].ToString().Trim();
                            getdata[3] = reader["Status"].ToString().Trim();
                            getdata[4] = reader["Machine_MainID"].ToString().Trim();
                            GetListGroup.Add(getdata);
                        }
                    }
                }
            }
            return GetListGroup;
        }

        public List<String[]> GetListEquipment(string MainGroupID)
        {
            List<String[]> GetListEquipment = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID],[Code],[Name],[Status],[Machine_GroupID],[Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday],[CheckID],[QuestionType],[Criteria] FROM [dbo].[VW_TPM_ListEquipment] WHERE [Machine_GroupID] = '" + MainGroupID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[15];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Code"].ToString().Trim();
                            getdata[2] = reader["Name"].ToString().Trim();
                            getdata[3] = reader["Status"].ToString().Trim();
                            getdata[4] = reader["Machine_GroupID"].ToString().Trim();
                            getdata[5] = reader["Monday"].ToString().Trim();
                            getdata[6] = reader["Tuesday"].ToString().Trim();
                            getdata[7] = reader["Wednesday"].ToString().Trim();
                            getdata[8] = reader["Thursday"].ToString().Trim();
                            getdata[9] = reader["Friday"].ToString().Trim();
                            getdata[10] = reader["Saturday"].ToString().Trim();
                            getdata[11] = reader["Sunday"].ToString().Trim();
                            getdata[12] = reader["CheckID"].ToString().Trim();
                            getdata[13] = reader["QuestionType"].ToString().Trim();
                            getdata[14] = reader["Criteria"].ToString().Trim();
                            GetListEquipment.Add(getdata);
                        }
                    }
                }
            }
            return GetListEquipment;
        }

        public List<String[]> GetListEquipmentRecordStart(string MainGroupID)
        {
            List<String[]> GetListEquipment = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID],[Code],[Name],[Status],[Machine_GroupID],[CheckID],[QuestionType],[Criteria] FROM [dbo].[VW_TPM_ListEquipment] WHERE [Machine_GroupID] = '" + MainGroupID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[8];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Code"].ToString().Trim();
                            getdata[2] = reader["Name"].ToString().Trim();
                            getdata[3] = reader["Status"].ToString().Trim();
                            getdata[4] = reader["Machine_GroupID"].ToString().Trim();
                            getdata[5] = reader["CheckID"].ToString().Trim();
                            getdata[6] = reader["QuestionType"].ToString().Trim();
                            getdata[7] = reader["Criteria"].ToString().Trim();
                            GetListEquipment.Add(getdata);
                        }
                    }
                }
            }
            return GetListEquipment;
        }

        public List<String[]> GetListEquipmentCheckList(string EquipmentID)
        {
            List<String[]> GetListEquipmentCheckList = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "EXEC [dbo].[SP_A_Select_Equip_Checklist] '" + EquipmentID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[7];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["List_Name"].ToString().Trim();
                            getdata[2] = reader["Picture"].ToString().Trim();
                            getdata[3] = reader["QuestionType"].ToString().Trim();
                            getdata[4] = reader["Machine_EquipID"].ToString().Trim();
                            getdata[5] = reader["CheckListValue"].ToString().Trim();
                            getdata[6] = reader["IDCheckBox"].ToString().Trim();
                            GetListEquipmentCheckList.Add(getdata);
                        }
                    }
                }
            }
            return GetListEquipmentCheckList;
        }

        public List<String[]> GetListEquipmentReason(string EquipmentID)
        {
            List<String[]> GetListEquipmentReason = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Equipment_ID] ,[Reason] ,[Seq] ,[Status] FROM [dbo].[TB_Machine_Equipment_Reason] WHERE [Equipment_ID] = '" + EquipmentID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[7];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Equipment_ID"].ToString().Trim();
                            getdata[2] = reader["Reason"].ToString().Trim();
                            getdata[3] = reader["Seq"].ToString().Trim();
                            getdata[4] = reader["Status"].ToString().Trim();
                            GetListEquipmentReason.Add(getdata);
                        }
                    }
                }
            }
            return GetListEquipmentReason;
        }

        public List<String[]> GetListEquipmentWorkingDay(string EquipmentID)
        {
            List<String[]> GetListEquipmentWorkingDay = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID],[Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday]  FROM [dbo].[TB_Machine_Equipment] WHERE [ID] = '" + EquipmentID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[8];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Monday"].ToString();
                            getdata[2] = reader["Tuesday"].ToString();
                            getdata[3] = reader["Wednesday"].ToString();
                            getdata[4] = reader["Thursday"].ToString();
                            getdata[5] = reader["Friday"].ToString();
                            getdata[6] = reader["Saturday"].ToString();
                            getdata[7] = reader["Sunday"].ToString();

                            GetListEquipmentWorkingDay.Add(getdata);
                        }
                    }
                }
            }
            return GetListEquipmentWorkingDay;
        }

        public List<String[]> GetListCompressor(string cust_num_site)
        {
            List<String[]> GetListCompressor = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Type] ,[Name] ,[cust_num_site] FROM [dbo].[TB_Compressor] WHERE [cust_num_site] = '" + cust_num_site + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[7];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Type"].ToString().Trim();
                            getdata[2] = reader["Name"].ToString().Trim();
                            getdata[3] = reader["cust_num_site"].ToString().Trim();
                            GetListCompressor.Add(getdata);
                        }
                    }
                }
            }
            return GetListCompressor;
        }

        public List<String[]> GetListCompressorDetail(string ID_Compressor, string TPMCode)
        {
            List<String[]> GetListCompressorDetail = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                //string sql = "SELECT [ID] ,[Compressor_ID] ,[Group_ID] ,[Group_Name] ,[Equipment_ID] ,[Equipment_Name],[TPMCode] FROM [dbo].[VW_TPM_Compressor_detail] WHERE [Compressor_ID] = '" + ID_Compressor + "'";
                string sql = "EXEC [dbo].[SP_A_Select_Compressor_Detail] '" + TPMCode + "','" + ID_Compressor + "'";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[16];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Compressor_ID"].ToString().Trim();
                            getdata[2] = reader["Group_ID"].ToString().Trim();
                            getdata[3] = reader["Group_Name"].ToString().Trim();
                            getdata[4] = reader["Equipment_ID"].ToString().Trim();
                            getdata[5] = reader["Equipment_Name"].ToString().Trim();
                            getdata[6] = reader["TPMCode"].ToString().Trim();
                            getdata[7] = reader["RegisterTPMCode"].ToString().Trim();
                            getdata[8] = reader["CompressorSuffix"].ToString().Trim();
                            getdata[9] = reader["QuestionOther"].ToString().Trim();
                            getdata[10] = reader["CheckID"].ToString().Trim();
                            getdata[11] = reader["QuestionType"].ToString().Trim();
                            getdata[12] = reader["RecordStart"].ToString().Trim();
                            getdata[13] = reader["Yellow_Criteria"].ToString().Trim();
                            getdata[14] = reader["Red_Criteria"].ToString().Trim();
                            getdata[15] = reader["Criteria"].ToString().Trim();
                            GetListCompressorDetail.Add(getdata);
                        }
                    }
                }
            }
            return GetListCompressorDetail;
        }

        public List<String[]> GetListCompressorDetailWorkingDay(string TPMCode)
        {
            List<String[]> GetListCompressorDetail = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [TPMCode],[CheckWorkingDay],[Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday],[MondayEq],[TuesdayEq],[WednesdayEq],[ThursdayEq],[FridayEq],[SaturdayEq],[SundayEq] FROM [dbo].[VW_TPM_Code_WorkingDay] WHERE [TPMCode] = '" + TPMCode + "'";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[16];
                            getdata[0] = reader["TPMCode"].ToString().Trim();
                            getdata[1] = reader["CheckWorkingDay"].ToString().Trim();
                            getdata[2] = reader["Monday"].ToString().Trim();
                            getdata[3] = reader["Tuesday"].ToString().Trim();
                            getdata[4] = reader["Wednesday"].ToString().Trim();
                            getdata[5] = reader["Thursday"].ToString().Trim();
                            getdata[6] = reader["Friday"].ToString().Trim();
                            getdata[7] = reader["Saturday"].ToString().Trim();
                            getdata[8] = reader["Sunday"].ToString().Trim();
                            getdata[9] = reader["MondayEq"].ToString().Trim();
                            getdata[10] = reader["TuesdayEq"].ToString().Trim();
                            getdata[11] = reader["WednesdayEq"].ToString().Trim();
                            getdata[12] = reader["ThursdayEq"].ToString().Trim();
                            getdata[13] = reader["FridayEq"].ToString().Trim();
                            getdata[14] = reader["SaturdayEq"].ToString().Trim();
                            getdata[15] = reader["SundayEq"].ToString().Trim();

                            GetListCompressorDetail.Add(getdata);
                        }
                    }
                }
            }
            return GetListCompressorDetail;
        }


        public List<String[]> GetListGroupCompressorDetail()
        {
            List<String[]> GetListGroup = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Code] ,[Name] ,[Status]  ,[CodeMain] FROM [dbo].[VW_TPM_Compressor_Detail_Group]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[5];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Code"].ToString().Trim();
                            getdata[2] = reader["Name"].ToString().Trim();
                            getdata[3] = reader["Status"].ToString().Trim();
                            getdata[4] = reader["CodeMain"].ToString().Trim();
                            GetListGroup.Add(getdata);
                        }
                    }
                }
            }
            return GetListGroup;
        }

        public List<String[]> GetListCompressorInsideModalSelect()
        {
            List<String[]> GetListCompressor = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Type] ,[Name] ,[cust_num_site] FROM [dbo].[TB_Compressor]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[7];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Type"].ToString().Trim();
                            getdata[2] = reader["Name"].ToString().Trim();
                            getdata[3] = reader["cust_num_site"].ToString().Trim();
                            GetListCompressor.Add(getdata);
                        }
                    }
                }
            }
            return GetListCompressor;
        }

        public List<String[]> GetListCompressorSet(string Cust_site)
        {
            List<String[]> GetListCompressorSet = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Name] ,[Cust_site] FROM [dbo].[TB_Pakage] WHERE [Cust_site] = '" + Cust_site + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[3];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Name"].ToString().Trim();
                            getdata[2] = reader["Cust_site"].ToString().Trim();
                            GetListCompressorSet.Add(getdata);
                        }
                    }
                }
            }
            return GetListCompressorSet;
        }

        public List<String[]> GetListCompressorSetDetail(string Cust_site)
        {
            List<String[]> GetListCompressorSet = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Name] ,[Cust_site] ,[ID_Compressor] ,[Type] ,[Name_Compressor] FROM [dbo].[VW_TPM_Compressor_Set] WHERE [Cust_site] = '" + Cust_site + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[6];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Name"].ToString().Trim();
                            getdata[2] = reader["Cust_site"].ToString().Trim();
                            getdata[3] = reader["ID_Compressor"].ToString().Trim();
                            getdata[4] = reader["Type"].ToString().Trim();
                            getdata[5] = reader["Name_Compressor"].ToString().Trim();
                            GetListCompressorSet.Add(getdata);
                        }
                    }
                }
            }
            return GetListCompressorSet;
        }


        public List<String[]> GetListRoom(string ID, string Packge_id)
        {
            List<String[]> GetListCompressorSet = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[PakageID] ,[RoomID] ,[RoomNo] ,[RoomName] ,[Code] ,[Name] FROM [dbo].[VW_TPM_Room]";
                if (ID != "") { sql += "WHERE [ID] = '" + ID + "'"; }
                if (Packge_id != "") { sql += "WHERE [PakageID] = '" + Packge_id + "'"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[7];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["PakageID"].ToString().Trim();
                            getdata[2] = reader["RoomID"].ToString().Trim();
                            getdata[3] = reader["RoomNo"].ToString().Trim();
                            getdata[4] = reader["RoomName"].ToString().Trim();
                            getdata[5] = reader["Code"].ToString().Trim();
                            getdata[6] = reader["Name"].ToString().Trim();
                            GetListCompressorSet.Add(getdata);
                        }
                    }
                }
            }
            return GetListCompressorSet;
        }


        public List<String[]> GetMachineDetail(string TPMCode)
        {
            List<String[]> GetMachineDetail = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {

                string sql = "SELECT [TPMCode] ,[Machine_MainID] ,[Machine_GroupID] ,[Machine_EquipmentID] ,[RoomID] ,[Package_ID] ,[Machine_MainName] ,[Machine_GroupName] ,[Machine_EquipmentName],[Machine_ID],[RoomNo] ,[RoomName],[MachineSuffix],[Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday],[QuestionOther],[RecordStart],[Yellow_Criteria],[Red_Criteria] FROM [dbo].[VW_TPMCode_Register] WHERE [TPMCode] = '" + TPMCode + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[24];
                            getdata[0] = reader["TPMCode"].ToString().Trim();
                            getdata[1] = reader["Machine_MainID"].ToString().Trim();
                            getdata[2] = reader["Machine_GroupID"].ToString().Trim();
                            getdata[3] = reader["Machine_EquipmentID"].ToString().Trim();
                            getdata[4] = reader["RoomID"].ToString().Trim();
                            getdata[5] = reader["Package_ID"].ToString().Trim();
                            getdata[6] = reader["Machine_MainName"].ToString().Trim();
                            getdata[7] = reader["Machine_GroupName"].ToString().Trim();
                            getdata[8] = reader["Machine_EquipmentName"].ToString().Trim();
                            getdata[9] = reader["Machine_ID"].ToString().Trim();
                            getdata[10] = reader["RoomNo"].ToString().Trim();
                            getdata[11] = reader["RoomName"].ToString().Trim();
                            getdata[12] = reader["MachineSuffix"].ToString().Trim();
                            getdata[13] = reader["Monday"].ToString().Trim();
                            getdata[14] = reader["Tuesday"].ToString().Trim();
                            getdata[15] = reader["Wednesday"].ToString().Trim();
                            getdata[16] = reader["Thursday"].ToString().Trim();
                            getdata[17] = reader["Friday"].ToString().Trim();
                            getdata[18] = reader["Saturday"].ToString().Trim();
                            getdata[19] = reader["Sunday"].ToString().Trim();
                            getdata[20] = reader["QuestionOther"].ToString().Trim();
                            getdata[21] = reader["RecordStart"].ToString().Trim();
                            getdata[22] = reader["Yellow_Criteria"].ToString().Trim();
                            getdata[23] = reader["Red_Criteria"].ToString().Trim();
                            GetMachineDetail.Add(getdata);
                        }
                    }
                }
            }
            return GetMachineDetail;
        }

        public List<String[]> GetLineConfigHeader()
        {
            List<String[]> GetLineConfigHeader = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {

                string sql = "SELECT [ID] ,[Msg_Name] FROM [dbo].[TB_LineConfig_Line_Header]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[2];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Msg_Name"].ToString().Trim();
                            GetLineConfigHeader.Add(getdata);
                        }
                    }
                }
            }
            return GetLineConfigHeader;
        }

        public List<String[]> GetLineConfigDetail(string Header_ID)
        {
            List<String[]> GetLineConfigDetail = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Seq] ,[msg_type] ,[Msg] ,[Header_ID] FROM [dbo].[TB_LineConfig_Line] WHERE [Header_ID] = '" + Header_ID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[5];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Seq"].ToString().Trim();
                            getdata[2] = reader["msg_type"].ToString().Trim();
                            getdata[3] = reader["Msg"].ToString().Trim();
                            getdata[4] = reader["Header_ID"].ToString().Trim();
                            GetLineConfigDetail.Add(getdata);
                        }
                    }
                }
            }
            return GetLineConfigDetail;
        }

        public List<String[]> GetServiceUser()
        {
            List<String[]> GetServiceTeam = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [Username] ,[Name] ,[Lastname] ,[Role] ,[Status] FROM [dbo].[TB_Service_User]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[5];
                            getdata[0] = reader["Username"].ToString().Trim();
                            getdata[1] = reader["Name"].ToString().Trim();
                            getdata[2] = reader["Lastname"].ToString().Trim();
                            getdata[3] = reader["Role"].ToString().Trim();
                            getdata[4] = reader["Status"].ToString().Trim();
                            GetServiceTeam.Add(getdata);
                        }
                    }
                }
            }
            return GetServiceTeam;
        }

        public List<String[]> GetServiceTeam()
        {
            List<String[]> GetServiceTeam = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Team_Name] FROM [dbo].[TB_Service_Team]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[2];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Team_Name"].ToString().Trim();
                            GetServiceTeam.Add(getdata);
                        }
                    }
                }
            }
            return GetServiceTeam;
        }

        public List<String[]> GetCustomer_inside_IssueList()
        {
            List<String[]> GetCustomer_inside_IssueList = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_num] ,[cust_name] ,[cust_num_site] ,[cust_site_name] FROM [dbo].[VW_Appointment_IssueList]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[4];
                            getdata[0] = reader["cust_num"].ToString().Trim();
                            getdata[1] = reader["cust_name"].ToString().Trim();
                            getdata[2] = reader["cust_num_site"].ToString().Trim();
                            getdata[3] = reader["cust_site_name"].ToString().Trim();
                            GetCustomer_inside_IssueList.Add(getdata);
                        }
                    }
                }
            }
            return GetCustomer_inside_IssueList;
        }


        public List<String[]> GetServiceTeamMember(String Team_id)
        {
            List<String[]> GetServiceTeam = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Team_Name] ,[Username] ,[Name] ,[Lastname] ,[Role] FROM [dbo].[VW_TPM_Service_Team_Member] WHERE [ID] = '" + Team_id + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[5];
                            getdata[0] = reader["ID"].ToString().Trim();
                            getdata[1] = reader["Team_Name"].ToString().Trim();
                            getdata[2] = reader["Username"].ToString().Trim();
                            getdata[3] = reader["Name"].ToString().Trim() + " " + reader["Lastname"].ToString().Trim();
                            getdata[4] = reader["Role"].ToString().Trim();
                            GetServiceTeam.Add(getdata);
                        }
                    }
                }
            }
            return GetServiceTeam;
        }


        public List<String[]> SP_TPM_Service_Team_Member_NonUser_Select(String Team_id)
        {
            List<String[]> GetServiceTeam = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "EXEC SP_TPM_Service_Team_Member_NonUser_Select '" + Team_id + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[3];
                            getdata[0] = reader["Username"].ToString().Trim();
                            getdata[1] = reader["Name"].ToString().Trim() + " " + reader["Lastname"].ToString().Trim();
                            getdata[2] = reader["Role"].ToString().Trim();
                            GetServiceTeam.Add(getdata);
                        }
                    }
                }
            }
            return GetServiceTeam;
        }

        public List<String[]> GetMonitoring_Task()
        {
            List<String[]> GetMonitoring_Task = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [AlarmYellow] ,[AlarmRed] ,[AlarmGrey] ,[IssueYellow] ,[IssueRed] ,[IssueGrey] ,[IssueReported] ,[HoldGreen] ,[HoldYellow] ,[HoldRed] ,[Reported] ,[Delay] FROM [dbo].[VW_Monitoring_Task]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[12];
                            getdata[0] = reader["AlarmYellow"].ToString().Trim();
                            getdata[1] = reader["AlarmRed"].ToString().Trim();
                            getdata[2] = reader["AlarmGrey"].ToString().Trim();
                            getdata[3] = reader["IssueYellow"].ToString().Trim();
                            getdata[4] = reader["IssueRed"].ToString().Trim();
                            getdata[5] = reader["IssueGrey"].ToString().Trim();
                            getdata[6] = reader["IssueReported"].ToString().Trim();
                            getdata[7] = reader["HoldGreen"].ToString().Trim();
                            getdata[8] = reader["HoldYellow"].ToString().Trim();
                            getdata[9] = reader["HoldRed"].ToString().Trim();
                            getdata[10] = reader["Delay"].ToString().Trim();
                            getdata[11] = reader["Reported"].ToString().Trim();
                            GetMonitoring_Task.Add(getdata);
                        }
                    }
                }
            }
            return GetMonitoring_Task;
        }

        public List<String[]> GetIssueList(string Status, string TPMCode, string ID, string IssueType)
        {
            List<String[]> GetIssueList = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID],[TPMCode] ,[Acting] ,[Status] ,[DueDate] ,[Detail] ,[Picture] ,[HoldReason] ,[Priority] ,[Machine_EquipmentName] ,[cust_num_site] ,[CreateDate] ,[FixStatus],[UpdateBy] ,[UpdateBy_Name] ,[PriorityName],[IssueType] FROM [dbo].[VW_IssueList_Detail] ";
                sql += " WHERE [Status] IN (" + Status + ") AND [IssueType] = '" + IssueType + "' ";
                if (ID != "")
                {
                    sql += " AND [ID] = '" + ID + "'";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[17];
                            getdata[0] = reader["TPMCode"].ToString().Trim();
                            getdata[1] = reader["Acting"].ToString().Trim();
                            getdata[2] = reader["Status"].ToString().Trim();
                            getdata[3] = reader["DueDate"].ToString().Trim();
                            getdata[4] = reader["Detail"].ToString().Trim();
                            getdata[5] = reader["Picture"].ToString().Trim();
                            getdata[6] = reader["HoldReason"].ToString().Trim();
                            getdata[7] = reader["Priority"].ToString().Trim();
                            getdata[8] = reader["Machine_EquipmentName"].ToString().Trim();
                            getdata[9] = reader["cust_num_site"].ToString().Trim();
                            getdata[10] = reader["CreateDate"].ToString().Trim();
                            getdata[11] = reader["FixStatus"].ToString().Trim();
                            getdata[12] = reader["UpdateBy"].ToString().Trim();
                            getdata[13] = reader["UpdateBy_Name"].ToString().Trim();
                            getdata[14] = reader["PriorityName"].ToString().Trim();
                            getdata[15] = reader["ID"].ToString().Trim();
                            getdata[16] = reader["IssueType"].ToString().Trim();
                            GetIssueList.Add(getdata);
                        }
                    }
                }
            }
            return GetIssueList;
        }
      
        public List<List<ArrayList>> SP_Monitoring_Report(string stcMonth, string stcYear)
        {
            DataTable DTData = new DataTable();

            SqlConnection Con = new SqlConnection(conTPMClound);
            SqlCommand Com = new SqlCommand();

            string sql = "EXEC SP_Monitoring_Report '" + stcMonth + "','" + stcYear + "' ";

            try
            {
                Con.Open();
                Com.Connection = Con;
                Com.CommandType = CommandType.Text;
                Com.CommandText = sql;
                Com.CommandTimeout = 0;
                DTData.Load(Com.ExecuteReader());
            }
            catch (SqlException ex)
            {
                Con.Close();
                Com.Dispose();
            }
            Con.Close();
            Com.Dispose();
            //Query ข้อมูล
            List<List<ArrayList>> ListTotal = new List<List<ArrayList>>();
            List<ArrayList> ListColumn = new List<ArrayList>();
            List<ArrayList> ListData = new List<ArrayList>();
            //สร้าง Columnหัวตาราง
            //สร้าง ข้อมูลข้างใน

            if (DTData.Rows.Count > 0)
            {
                foreach (DataColumn row in DTData.Columns)
                {
                    ArrayList detail = new ArrayList();
                    detail.Add(row.ColumnName.ToString());
                    ListColumn.Add(detail);
                }

                foreach (DataRow row in DTData.Rows)
                {
                    ArrayList detail = new ArrayList();
                    for (int i = 0; i < row.ItemArray.Length; i++) { detail.Add(row[i].ToString()); }
                    ListData.Add(detail);
                }

                ListTotal.Add(ListColumn);
                ListTotal.Add(ListData);
            }
            return ListTotal;
        }
        public List<String[]> GetIssueHoldReason()
        {
            List<String[]> GetIssueHoldReason = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [Holdreason_ID] ,[Name] FROM [dbo].[TB_Issue_Holdreason]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[2];
                            getdata[0] = reader["Holdreason_ID"].ToString().Trim();
                            getdata[1] = reader["Name"].ToString().Trim();
                            GetIssueHoldReason.Add(getdata);
                        }
                    }
                }
            }
            return GetIssueHoldReason;
        }

        public List<String[]> GetCustomerSiteMonitoringList(string BrowseType)
        {
            List<String[]> GetCustomerSiteMonitoringList = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "";
                if (BrowseType == "Alarm")
                {
                    sql = "SELECT [TPMQty] ,[cust_num_site] ,[CustomerName] FROM [dbo].[VW_Monitoring_Alarm_Browse]";
                }
                else if (BrowseType == "Issue")
                {
                    sql = "SELECT [TPMQty] ,[cust_num_site] ,[CustomerName] FROM [dbo].[VW_Monitoring_Issue_Browse]";
                }
                else if (BrowseType == "Report")
                {
                    sql = "SELECT [TPMQty] ,[cust_num_site] ,[CustomerName] FROM [dbo].[VW_Monitoring_Report_Browse]";
                }
                else if (BrowseType == "Hold")
                {
                    sql = "SELECT [TPMQty] ,[cust_num_site] ,[CustomerName] FROM [dbo].[VW_Monitoring_Hold_Browse]";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[3];
                            getdata[0] = reader["TPMQty"].ToString().Trim();
                            getdata[1] = reader["cust_num_site"].ToString().Trim();
                            getdata[2] = reader["CustomerName"].ToString().Trim();
                            GetCustomerSiteMonitoringList.Add(getdata);
                        }
                    }
                }
            }
            return GetCustomerSiteMonitoringList;
        }

        public List<String[]> GetMonitoringTaskDetail(string BrowseType, string cust_site)
        {
            List<String[]> GetMonitoringTaskDetail = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "";
                if (BrowseType == "Alarm")
                {
                    sql = "SELECT [ID],[TPMCode] ,[Acting] ,[Status] ,[DueDate] ,[Detail] ,[Picture] ,[HoldReason] ,[Priority] ,[Machine_EquipmentName] ,[cust_num_site] ,[CreateDate] ,[FixStatus] ,[MonitorType],[PriorityName],[IssueType] FROM [dbo].[VW_Monitoring_Alarm]";
                }
                else if (BrowseType == "Issue")
                {
                    sql = "SELECT [ID],[TPMCode] ,[Acting] ,[Status] ,[DueDate] ,[Detail] ,[Picture] ,[HoldReason] ,[Priority] ,[Machine_EquipmentName] ,[cust_num_site] ,[CreateDate] ,[FixStatus] ,[MonitorType],[PriorityName],[IssueType] FROM [dbo].[VW_Monitoring_Issue]";
                }
                else if (BrowseType == "Report")
                {
                    sql = "SELECT [ID],[TPMCode] ,[Acting] ,[Status] ,[DueDate] ,[Detail] ,[Picture] ,[HoldReason] ,[Priority] ,[Machine_EquipmentName] ,[cust_num_site] ,[CreateDate] ,[FixStatus] ,[MonitorType], '' as 'PriorityName',[IssueType] FROM [dbo].[VW_Monitoring_Report]";
                }
                else if (BrowseType == "Hold")
                {
                    sql = "SELECT [ID],[TPMCode] ,[Acting] ,[Status] ,[DueDate] ,[Detail] ,[Picture] ,[HoldReason] ,[Priority] ,[Machine_EquipmentName] ,[cust_num_site] ,[CreateDate] ,[FixStatus] ,[MonitorType], '' as 'PriorityName',[IssueType] FROM [dbo].[VW_Monitoring_Hold]";
                }

                sql += "WHERE [cust_num_site] = '" + cust_site + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getdata = new String[16];
                            getdata[0] = reader["TPMCode"].ToString().Trim();
                            getdata[1] = reader["Acting"].ToString().Trim();
                            getdata[2] = reader["Status"].ToString().Trim();
                            getdata[3] = reader["DueDate"].ToString().Trim();
                            getdata[4] = reader["Detail"].ToString().Trim();
                            getdata[5] = reader["Picture"].ToString().Trim();
                            getdata[6] = reader["HoldReason"].ToString().Trim();
                            getdata[7] = reader["Priority"].ToString().Trim();
                            getdata[8] = reader["Machine_EquipmentName"].ToString().Trim();
                            getdata[9] = reader["cust_num_site"].ToString().Trim();
                            getdata[10] = reader["CreateDate"].ToString().Trim();
                            getdata[11] = reader["FixStatus"].ToString().Trim();
                            getdata[12] = reader["MonitorType"].ToString().Trim();
                            getdata[13] = reader["PriorityName"].ToString().Trim();
                            getdata[14] = reader["ID"].ToString().Trim();
                            getdata[15] = reader["IssueType"].ToString().Trim();
                            GetMonitoringTaskDetail.Add(getdata);
                        }
                    }
                }
            }
            return GetMonitoringTaskDetail;
        }

        public List<ArrayList> GetLoginTPM(string user, string pass)
        {
            List<ArrayList> GetLoginTPM = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT TOP(1) [Username],[Name],[Email],[LineID],[Type],[Customer_Site] FROM [dbo].[VW_TPM_Portal_Login] WHERE ([Type] IN ('Admin','Patkol')) AND [Username] = '" + user + "' AND [Password] = '" + pass + "'";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetLoginTPM.Add(get);
                        }
                    }
                }
            }
            return GetLoginTPM;
        }

        public List<ArrayList> GetUserPushLine(string custsite)
        {
            List<ArrayList> GetUserPushLine = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [Username] ,[Name] ,[LineID] ,[Type] FROM [dbo].[VW_TPM_Portal_Login] WHERE ([LineID] is not null) AND ((([Customer_Site] = '" + custsite + "') AND ([Type] = 'Manager')) OR ([Type] = 'Admin' AND [RoleEmp] = 'Supervisor'))";
                // string sql = "SELECT [Username] ,[Name] ,[LineID] ,[Type] FROM [dbo].[VW_TPM_Portal_Login] WHERE ([LineID] is not null)AND (([Customer_Site] = '9') OR ([Type] = 'Admin' AND [RoleEmp] = 'Supervisor')) AND [Username] IN ('User01','User02','nattakrit.pi')";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetUserPushLine.Add(get);
                        }
                    }
                }
            }
            return GetUserPushLine;
        }

        public List<ArrayList> GetUserPushLineOwner(string custsite)
        {
            List<ArrayList> GetUserPushLine = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [Username] ,[Name] ,[LineID] ,[Type] FROM [dbo].[VW_TPM_Portal_Login] WHERE ([LineID] is not null) AND ((([Customer_Site] = '" + custsite + "') AND ([Type] = 'Owner')) OR ([Type] = 'Admin' AND [RoleEmp] = 'Supervisor'))";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetUserPushLine.Add(get);
                        }
                    }
                }
            }
            return GetUserPushLine;
        }

        public List<ArrayList> GetListAwaitAssign()
        {
            List<ArrayList> GetListAwaitAssign = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_name] ,[cust_site_name] ,[appNo] ,[cust_site] FROM [dbo].[VW_Appointment_AwaitAssign]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListAwaitAssign.Add(get);
                        }
                    }
                }
            }
            return GetListAwaitAssign;
        }

        public List<ArrayList> GetListAwaitAssign_New()
        {
            List<ArrayList> GetListAwaitAssign = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_name] ,[cust_site_name] ,[appNo] ,[cust_site] ,CONVERT(varchar(50),[working_date],103) as [working_date] ,[plan_starttime] ,[plan_endtime] ,[team_ID] ,[Team_Name] ,[AppName] FROM [dbo].[VW_Appointment_Trans_AwaitAssign]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListAwaitAssign.Add(get);
                        }
                    }
                }
            }
            return GetListAwaitAssign;
        }

        public List<ArrayList> GetListAssignMyTask()
        {
            List<ArrayList> GetListAssignMyTask = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_name] ,[cust_site_name] ,[Team_Name] ,CONVERT(varchar(50),[working_date],103) as [working_date] ,[plan_starttime] ,[status] ,[appNo],[cust_num_site] FROM [dbo].[VW_Appointment_MyTask]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListAssignMyTask.Add(get);
                        }
                    }
                }
            }
            return GetListAssignMyTask;
        }

        public List<ArrayList> GetListAssignMyTask_New()
        {
            List<ArrayList> GetListAssignMyTask = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_name] ,[cust_site_name] ,[Team_Name] , CONVERT(varchar(50),[working_date],103) as [working_date] ,[plan_starttime] ,[status] ,[appNo] ,[cust_num_site] ,[AppName] FROM [dbo].[VW_Appointment_Trans_MyTask]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListAssignMyTask.Add(get);
                        }
                    }
                }
            }
            return GetListAssignMyTask;
        }

        public List<ArrayList> GetListRegisterTPM(string cust_site)
        {
            List<ArrayList> GetListRegisterTPM = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [Machine_EquipmentName],[TPMCode] FROM [dbo].[VW_TPMCode_Register] WHERE [cust_num_site] = '" + cust_site + "' ORDER BY [TPMCode] ASC";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListRegisterTPM.Add(get);
                        }
                    }
                }
            }
            return GetListRegisterTPM;
        }

        public List<ArrayList> GetListSchedule(string cust_num)
        {
            List<ArrayList> GetListRegisterTPM = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[cust_num_site] ,[cust_site_name] ,[Schedule] ,[cust_num] FROM [dbo].[VW_Schedule] WHERE [cust_num] = '" + cust_num + "' ORDER BY [cust_num_site]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListRegisterTPM.Add(get);
                        }
                    }
                }
            }
            return GetListRegisterTPM;
        }

        public List<ArrayList> GetCheckDairyReport()
        {
            List<ArrayList> GetListRegisterTPM = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_num_site] ,[Msg91] ,[Msg92] ,[Msg93],[cust_name],[cust_site_name] FROM [dbo].[VW_DairyReport_CustSiteSummary]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListRegisterTPM.Add(get);
                        }
                    }
                }
            }
            return GetListRegisterTPM;
        }

        public List<ArrayList> GetCheckDairyReportYRQty(string cust_site)
        {
            List<ArrayList> GetListRegisterTPM = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_site] ,[YellowPK] ,[YellowCust] ,[RedPK] ,[RedCust] FROM [dbo].[VW_DairyReport_CustSiteSummary_YRQty] WHERE [cust_site] = '" + cust_site + "'";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListRegisterTPM.Add(get);
                        }
                    }
                }
            }
            return GetListRegisterTPM;
        }

        public List<ArrayList> GetListMonitorTPMCode()
        {
            List<ArrayList> GetListMonitorTPMCode = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_num],[cust_num_site],[cust_name],COUNT(TPMCode) as 'countTPM' FROM [dbo].[VW_TPMCode_Register] WHERE ([cust_num] is not null) GROUP BY [cust_num],[cust_num_site],[cust_name]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListMonitorTPMCode.Add(get);
                        }
                    }
                }
            }
            return GetListMonitorTPMCode;
        }

        public List<ArrayList> GetDetailMonitorTPMCode(string cust_site)
        {
            List<ArrayList> GetDetailMonitorTPMCode = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_num],[cust_num_site],[TPMCode],[Machine_EquipmentName],[cust_name] FROM [dbo].[VW_TPMCode_Register] WHERE [cust_num_site] = '" + cust_site + "'";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetDetailMonitorTPMCode.Add(get);
                        }
                    }
                }
            }
            return GetDetailMonitorTPMCode;
        }

        public List<ArrayList> GetReportMonitorTimeChecked()
        {
            List<ArrayList> GetReportMonitorTimeChecked = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                //string sql = "SELECT [cust_name] ,[cust_site] ,[cust_site_name] ,[QtyNormal] ,[QtyDelay] ,[QtyNotReport] FROM [dbo].[VW_Rpt_CheckingStatus_Summary_Format]";
                string sql = "SELECT [cust_name], [cust_num_site] ,[cust_site_name] ,[RQty] ,[DQty] ,[NQty] FROM [dbo].[VW_Rpt_CheckingStatus_Summary_V2] ORDER BY cust_name ";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetReportMonitorTimeChecked.Add(get);
                        }
                    }
                }
            }
            return GetReportMonitorTimeChecked;
        }

        public List<ArrayList> GetReportMonitorChecked()
        {
            List<ArrayList> GetReportMonitorChecked = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_name] ,[cust_site] ,[cust_site_name] ,[Green] ,[Yellow] ,[Red] FROM [dbo].[VW_Rpt_CheckingPriority_Summary]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetReportMonitorChecked.Add(get);
                        }
                    }
                }
            }
            return GetReportMonitorChecked;
        }

        public List<ArrayList> GetReportMonitorTransactionDetail()
        {
            List<ArrayList> GetReportMonitorTransactionDetail = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [cust_name] ,[cust_site_name] ,CONVERT(DATETIME,[CheckDate],103) as [CheckDate] ,[CheckingStatus] ,[Green] ,[Yellow] ,[Red] FROM [dbo].[VW_Rpt_CheckingTransaction_Detail] ORDER BY [cust_site_name],[CheckDate]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetReportMonitorTransactionDetail.Add(get);
                        }
                    }
                }
            }
            return GetReportMonitorTransactionDetail;
        }

        public List<ArrayList> GetCustomerReport(string ID, string cust_num, string cust_site)
        {
            List<ArrayList> GetCustomerReport = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[cust_num] ,[cust_name] ,[cust_site] ,[cust_site_name] ,[TypeReport] ,[ReportName] FROM [dbo].[VW_Customer_Report] ";
                sql += " WHERE 1=1 ";
                if (cust_num != "") { sql += " AND [cust_num] = '" + cust_num + "' "; }
                if (cust_site != "") { sql += " AND [cust_site] = '" + cust_site + "' "; }
                if (ID != "") { sql += " AND [ID] = '" + ID + "' "; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetCustomerReport.Add(get);
                        }
                    }
                }
            }
            return GetCustomerReport;
        }

        public List<ArrayList> GetCustomerReportDetail(string ID)
        {
            List<ArrayList> GetCustomerReport = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[ListLevel] ,[CheckList_ID] ,[List_Name] ,[HeaderName] ,[Type] ,[Report_ID] FROM [dbo].[VW_Customer_Report_Detail] ";
                sql += " WHERE [Report_ID] = '" + ID + "' ORDER BY [ListLevel] ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetCustomerReport.Add(get);
                        }
                    }
                }
            }
            return GetCustomerReport;
        }

        public List<ArrayList> GetListCheckListForCustomerReport(string Report_ID)
        {
            List<ArrayList> GetListCheckListForCustomerReport = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "EXEC SP_A_Select_CustomerReport_Detail_CheckList '" + Report_ID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListCheckListForCustomerReport.Add(get);
                        }
                    }
                }
            }
            return GetListCheckListForCustomerReport;
        }

        public DataTable GetCustomerReportPDF(string Report_ID)
        {
            string sql = "SELECT [cust_site] ,[TypeReport] ,[ReportName] FROM [dbo].[TB_TPM_Customer_Report] WHERE [ID] = " + Report_ID + "";
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand(sql, connection);
            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }

        public DataTable GetExportCustomerReportv2(string cust_site, string report_ID, string month, string year)
        {
            string sql = "EXEC [dbo].[SP_Customer_Report_Export] '" + cust_site + "','" + report_ID + "','" + month + "','" + year + "'";
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }

        public DataTable GetExportCustomerReportLogo(string cust_site)
        {
            string sql = "SELECT TOP(1) [cust_num],[cust_name],[cust_num_site],[cust_site_name],[cust_logo] FROM [dbo].[VW_Customer_Logo] WHERE [cust_num_site] = " + cust_site + "";
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }

        public DataTable DT_SP_Monitoring_Report(string stcMonth, string stcYear)
        {
            string sql = "EXEC SP_Monitoring_Report '" + stcMonth + "','" + stcYear + "' ";
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conTPMClound);
            SqlCommand cmd = new SqlCommand(sql, connection);
            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }

        public List<ArrayList> GetListGuideLocation()
        {
            List<ArrayList> GetListGuideLocation = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Name] ,[Type_Location] FROM [dbo].[TB_Guide_Location] WHERE [Type_Location] = 'TPMPatkol'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListGuideLocation.Add(get);
                        }
                    }
                }
            }
            return GetListGuideLocation;
        }

        public List<ArrayList> GetListGuideMain(string IDType, string Keyword)
        {
            List<ArrayList> GetListGuideMain = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "";

                if (Keyword != "")
                {
                    sql += "SELECT [ID] ,[Name_Guide] ,[Location_ID] ,[Name] FROM [dbo].[VW_TPM_Help_Guide_Link]";
                    sql += " WHERE [Location_ID] = '" + IDType + "' OR [Name] LIKE('%" + Keyword + "%')";
                }
                else
                {
                    sql = "SELECT [ID],[Name_Guide],[Location_ID] FROM [dbo].[TB_Guide_Main] WHERE [Location_ID] = '" + IDType + "'";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListGuideMain.Add(get);
                        }
                    }
                }
            }
            return GetListGuideMain;
        }

        public List<ArrayList> GetListGuideStep(string IDMain)
        {
            List<ArrayList> GetListGuideStep = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Main_ID] ,[StepNo] ,[StepName] FROM [dbo].[TB_Guide_Step] WHERE [Main_ID] = '" + IDMain + "' ORDER BY [StepNo]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListGuideStep.Add(get);
                        }
                    }
                }
            }
            return GetListGuideStep;
        }

        public List<ArrayList> GetListGuideStepDetail(string IDStep)
        {
            List<ArrayList> GetListGuideStepDetail = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conTPMClound))
            {
                string sql = "SELECT [ID] ,[Step_ID] ,[ListNo] ,[IMG_Path] ,[Description] FROM [dbo].[TB_Guide_Step_Detail] WHERE [Step_ID] = '" + IDStep + "' ORDER BY [ListNo]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList get = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++) { get.Add(reader[i].ToString()); }
                            GetListGuideStepDetail.Add(get);
                        }
                    }
                }
            }
            return GetListGuideStepDetail;
        }

    }
}