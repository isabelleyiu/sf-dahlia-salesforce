<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>MEM_Copy_Apt_Unit</fullName>
        <field>Apt_Unit__c</field>
        <formula>Parent_Group__r.Apt_Unit__c</formula>
        <name>MEM: Copy Apt./Unit #</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MEM_Copy_City</fullName>
        <field>City__c</field>
        <formula>Parent_Group__r.City__c</formula>
        <name>MEM: Copy City</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MEM_Copy_State</fullName>
        <description>Parent_Group__r.State__c</description>
        <field>State__c</field>
        <name>MEM: Copy State</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MEM_Copy_Street_Name</fullName>
        <field>Street_Name__c</field>
        <formula>Parent_Group__r.Street_Name__c</formula>
        <name>MEM: Copy Street Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MEM_Copy_Street_Number</fullName>
        <field>Street_Number__c</field>
        <formula>Parent_Group__r.Street_Number__c</formula>
        <name>MEM: Copy Street Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MEM_Copy_Zip_Code</fullName>
        <field>Zip_Code__c</field>
        <formula>Parent_Group__r.Zip_Code__c</formula>
        <name>MEM: Copy Zip Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MEM_Uncheck_Copy_Household_Address</fullName>
        <field>Copy_Household_Current_Address__c</field>
        <literalValue>0</literalValue>
        <name>MEM: Uncheck Copy Household Address</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>CONTACT MEMBER%3A Copy Household Address</fullName>
        <actions>
            <name>MEM_Copy_Apt_Unit</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MEM_Copy_City</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MEM_Copy_State</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MEM_Copy_Street_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MEM_Copy_Street_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MEM_Copy_Zip_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MEM_Uncheck_Copy_Household_Address</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Members__c.Copy_Household_Current_Address__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
