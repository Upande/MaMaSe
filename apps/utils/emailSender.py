import smtplib

def send_email(html_content,from_email,to):
    smtp_user = "AKIAJNMYKO7A3NSJNZXQ"
    smtp_pass = "AjRTQfqglh9YQmVVT1JxK2q7npOakgUJdLfXAlK0ckOz"
    smtp_server = "email-smtp.us-east-1.amazonaws.com"
    smtp_port = "587"
    smtp = smtplib.SMTP(smtp_server,smtp_port)
    smtp.starttls()
    smtp.ehlo()
    smtp.login(smtp_user,smtp_pass)
    smtp.sendmail(from_email,to,html_content)
    smtp.close()
