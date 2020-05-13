DROP KEYSPACE central_ledger;

CREATE KEYSPACE central_ledger WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};

USE central_ledger;

CREATE TABLE contactType (
  contactTypeId UUID NOT NULL,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(512) NULL,
  isActive BOOLEAN NOT NULL,
  createdDate TIMESTAMP NOT NULL,
  PRIMARY KEY (contactTypeId));

CREATE UNIQUE INDEX contacttype_name_unique ON contactType(name);


CREATE TABLE currency (
  currencyId VARCHAR(3) NOT NULL,
  name VARCHAR(128) NULL,
  isActive BOOLEAN NOT NULL,
  createdDate TIMESTAMP NOT NULL,
  PRIMARY KEY (currencyId));

CREATE TABLE endpointType (
  endpointTypeId UUID NOT NULL,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(512) NULL,
  isActive TINYINT(1) NOT NULL,
  createdDate TIMESTAMP NOT NULL,
  PRIMARY KEY (endpointTypeId));

  CREATE UNIQUE INDEX endpointtype_name_unique ON endpointType(name);


CREATE TABLE event(
  eventId UUID,
  name VARCHAR(128) NOT NULL,
  description VARCHAR(512) NULL,
  createdDate TIMESTAMP NOT NULL,
  PRIMARY KEY (eventId));

CREATE TABLE transferDuplicateCheck (
  transferId VARCHAR(36) NOT NULL,
  hash VARCHAR(256) NOT NULL,
  createdDate TIMESTAMP NOT NULL,
  PRIMARY KEY (transferId));

CREATE TABLE transfer (
  transferId UUID NOT NULL,
  amount DECIMAL(18,2) NOT NULL,
  currencyId VARCHAR(3) NOT NULL,
  ilpCondition VARCHAR(256) NOT NULL,
  expirationDate TIMESTAMP NOT NULL,
  createdDate TIMESTAMP NOT NULL,
  PRIMARY KEY (transferId));