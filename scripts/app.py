import streamlit as st
import pandas as pd
# from pandasai import SmartDataframe
# from pandasai.llm import OpenAI
import os
from dotenv import load_dotenv

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

load_dotenv()

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

with st.container():
    st.subheader("Prompt to get what you desire")
    prompt = st.text_input('Specify in the text box below what do you want')
    if prompt is not None and df is not None:
        llm = OpenAI(api_token=os.environ["OPENAI_API_KEY"])
        sdf = SmartDataframe(df, config={"llm":llm})
        response = sdf.chat(prompt)
        st.write(f"""
        {response}
        """)
