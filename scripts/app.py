import streamlit as st
import pandas as pd

def data_upload():

    extensios_allowed = ["csv", "xls", "xlsx"]
    data = st.file_uploader("Down below upload your data file", type=extensios_allowed)

    return data

def read_data(data) -> pd.DataFrame:

    if data:

        if data.name.endswith('csv'):
            df = pd.read_csv(data)
        elif data.name.endswith('xls') | data.name.endswith('xlsx'):
            df = pd.read_excel(data)
        else:
            df = None
        return df

def print_dataframe(df: pd.DataFrame):

    if df is not None:
        st.dataframe(df)

def dataframe_check(df: pd.DataFrame):

    if df is not None:
        check = st.button("Reset")
        return check

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
    data = data_upload()
    df = read_data(data)
    st.subheader("Data upload's Head")
    print_dataframe(df)