# 🚀 Terraform 3-Tier AWS Architecture

This project demonstrates a **3-tier architecture** deployed on AWS using Terraform.

## 📌 Overview

The architecture consists of:

* **Frontend Layer** → Public EC2 instance
* **Backend Layer** → Private EC2 instance
* **Database Layer** → RDS MySQL

```id="k3n9xp"
Internet → Frontend → Backend → Database
```

---

## 🛠️ Technologies Used

* Terraform
* AWS (VPC, EC2, RDS)

---

## 📁 Project Structure

```id="y3xq7r"
.
├── provider.tf
├── variables.tf
├── main.tf
├── outputs.tf
└── terraform.tfvars
```

---

## ⚙️ Features

* Custom VPC with public and private subnets
* Internet Gateway for public access
* EC2 instances for frontend and backend
* RDS database setup
* Security groups configuration

---

## 🚀 How to Run

### 1. Initialize Terraform

```
terraform init
```

### 2. Plan the Infrastructure

```
terraform plan
```

### 3. Apply the Configuration

```
terraform apply
```

---

## 📤 Outputs

* Frontend Public IP
* Backend Private IP
* Database Endpoint

---

## 🧹 Cleanup

To destroy all resources:

```
terraform destroy
```

---

## ⚠️ Notes

* Do not commit `.terraform/` folder
* Ignore `.tfstate` files

Example `.gitignore`:

```
.terraform/
*.tfstate
*.tfstate.backup
```

---

## 👨‍💻 Author

Sachin Bhand
