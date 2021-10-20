
Use [IDA.DB]
Go


CREATE TABLE "User"(
    "UserName" NVARCHAR(255) NOT NULL,
    "Email" NVARCHAR(255) NOT NULL,
    "FirstName" NVARCHAR(255) NOT NULL,
    "UserPswd" NVARCHAR(255) NOT NULL,
    "Adress" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "User" ADD CONSTRAINT "user_username_primary" PRIMARY KEY("UserName");
CREATE TABLE "Costomers"(
    "CId" INT NOT NULL,
    "UserName" NVARCHAR(255) NOT NULL,
    "Lid" INT NOT NULL
);
ALTER TABLE
    "Costomers" ADD CONSTRAINT "costomers_cid_primary" PRIMARY KEY("CId");
CREATE TABLE "Workers"(
    "WId" INT NOT NULL,
    "UserName" NVARCHAR(255) NOT NULL,
    "LId" INT NOT NULL
);
ALTER TABLE
    "Workers" ADD CONSTRAINT "workers_wid_primary" PRIMARY KEY("WId");
CREATE TABLE "Services"(
    "SId" INT NOT NULL,
    "Name" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Services" ADD CONSTRAINT "services_sid_primary" PRIMARY KEY("SId");
CREATE TABLE "WorkerServices"(
    "SWId" INT NOT NULL,
    "SId" INT NOT NULL,
    "WId" INT NOT NULL,
    "Price" FLOAT NOT NULL
);
ALTER TABLE
    "WorkerServices" ADD CONSTRAINT "workerservices_swid_primary" PRIMARY KEY("SWId");
CREATE TABLE "JobOffer"(
    "JId" INT NOT NULL,
    "WId" INT NOT NULL,
    "CId" INT NOT NULL,
    "SWId" INT NOT NULL,
    "Time" INT NOT NULL,
    "Status" INT NOT NULL,
    "RId" INT NOT NULL
);
ALTER TABLE
    "JobOffer" ADD CONSTRAINT "joboffer_jid_primary" PRIMARY KEY("JId");
CREATE TABLE "Reviews"(
    "RId" INT NOT NULL,
    "SId" INT NOT NULL,
    "SName" NVARCHAR(255) NOT NULL,
    "Date" DATE NOT NULL,
    "Rate" INT NOT NULL,
    "CId" INT NOT NULL,
    "WId" INT NOT NULL,
    "JId" INT NOT NULL
);
ALTER TABLE
    "Reviews" ADD CONSTRAINT "reviews_rid_primary" PRIMARY KEY("RId");
CREATE TABLE "Location"(
    "LId" INT NOT NULL,
    "City" NVARCHAR(255) NOT NULL,
    "Adress" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Location" ADD CONSTRAINT "location_lid_primary" PRIMARY KEY("LId");
CREATE TABLE "Status"(
    "StatusId" INT NOT NULL,
    "Description" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Status" ADD CONSTRAINT "status_statusid_primary" PRIMARY KEY("StatusId");
ALTER TABLE
    "JobOffer" ADD CONSTRAINT "joboffer_cid_foreign" FOREIGN KEY("CId") REFERENCES "Costomers"("CId");
ALTER TABLE
    "Reviews" ADD CONSTRAINT "reviews_cid_foreign" FOREIGN KEY("CId") REFERENCES "Costomers"("CId");
ALTER TABLE
    "Costomers" ADD CONSTRAINT "costomers_username_foreign" FOREIGN KEY("UserName") REFERENCES "User"("UserName");
ALTER TABLE
    "Costomers" ADD CONSTRAINT "costomers_lid_foreign" FOREIGN KEY("Lid") REFERENCES "Location"("LId");
ALTER TABLE
    "JobOffer" ADD CONSTRAINT "joboffer_wid_foreign" FOREIGN KEY("WId") REFERENCES "Workers"("WId");
ALTER TABLE
    "Workers" ADD CONSTRAINT "workers_username_foreign" FOREIGN KEY("UserName") REFERENCES "User"("UserName");
ALTER TABLE
    "WorkerServices" ADD CONSTRAINT "workerservices_sid_foreign" FOREIGN KEY("SId") REFERENCES "Services"("SId");
ALTER TABLE
    "WorkerServices" ADD CONSTRAINT "workerservices_wid_foreign" FOREIGN KEY("WId") REFERENCES "Workers"("WId");
ALTER TABLE
    "Reviews" ADD CONSTRAINT "reviews_wid_foreign" FOREIGN KEY("WId") REFERENCES "Workers"("WId");
ALTER TABLE
    "Reviews" ADD CONSTRAINT "reviews_jid_foreign" FOREIGN KEY("JId") REFERENCES "JobOffer"("JId");
ALTER TABLE
    "JobOffer" ADD CONSTRAINT "joboffer_swid_foreign" FOREIGN KEY("SWId") REFERENCES "WorkerServices"("SWId");
ALTER TABLE
    "JobOffer" ADD CONSTRAINT "joboffer_rid_foreign" FOREIGN KEY("RId") REFERENCES "Reviews"("RId");
ALTER TABLE
    "Workers" ADD CONSTRAINT "workers_lid_foreign" FOREIGN KEY("LId") REFERENCES "Location"("LId");
ALTER TABLE
    "JobOffer" ADD CONSTRAINT "joboffer_status_foreign" FOREIGN KEY("Status") REFERENCES "Status"("StatusId");