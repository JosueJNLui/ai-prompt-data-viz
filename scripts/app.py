import streamlit as st

def data_upload():
    extensios_allowed = ["csv", "xls", "xlsx"]
    data = st.file_uploader("Down below upload your data file", type=extensios_allowed)


st.set_page_config(page_title="Data Viz generation using prompt")

with st.container():
    st.header("Your Data Viz generator")
    st.write("---")
    st.subheader("Create data viz just prompting!")
    st.write("""
    The current website was created to dimish the time spend to create some charts and to remove the complexity attached to it.
    You just have to upload your data - CSV and XLS/XLSX are the extensions allowed - and them prompt the information needed to get the output as you desire!
    """)

with st.container():
    st.subheader("Upload your Data")
    data_upload()