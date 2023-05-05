#From: https://atlassianps.org/module/JiraPS/
#Review the help at any time!
#Get-Help about_JiraPS
#Get-Command -Module JiraPS
#Get-Help Get-JiraIssue -Full # or any other command

#Variables
$jira1 = 'https://jira.cerner.com/'
$jira2 = 'https://jira2.cerner.com/'
$product_owner = 'DB035032'
$menu = "

******** Master JIRA Manipulator *********
__________________________________________
\\\\\\\\\\\\\\\\\MAIN MENU////////////////
__________________________________________
What would you like to do?

1 - Install JiraPS
2 - Process Jira
3 - Add Cert Guidelines Subtask
4 - Create JForm
5 - Create corresponding Cert Guidelines Jira

x - Exit
__________________________________________
Selection"
$subtask_menu = "
__________________________________________
\\\\\\\\\\\\\\\\\SUB TASKS////////////////
__________________________________________
What subtask would you like to add?

1 - Requirements
2 - Design/Implementation/WB
3 - Scan
4 - Create Test Plan
5 - Build/Feature
6 - Execute Testing
7 - Documentation/Cert Guidelines
8 - Exploratory Test Case
9 - Main Menu
__________________________________________
Selection"
function requirements_subtask {
	param($Jira)
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Requirements" -Description "Create & Tag Requirements" -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function design_implement_whitebox_subtask {
	param($Jira)
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Design/Implementation/WB" -Description "Coding efforts including: design, code, implement, white box test" -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function scan_subtask {
	param($Jira)
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Scan" -Description "Complete all applicable scans: Fortify, Klocwork, etc.

See Fortify Instructions
https://wiki.cerner.com/display/CC/Fortify+Development+Process.

If you fix anything as a result of the scan, add a comment on the Quarterly Fortify Scan Jira." -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function create_test_plan_subtask {
	param($Jira)
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Create Test Plan" -Description "Create or identify test cases and include in a test plan" -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function build_subtask {
	param($Jira)
	Write-host "This is the incoming Jira:" $Jira
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Build/Feature" -Description "Deploy code internally or do whatever is necessary to prepare to release this to the environment" -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function execute_test_subtask {
	param($Jira)
	Write-host "This is the incoming Jira:" $Jira
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Execute Testing" -Description "Execute testing" -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function create_certtest_subtask {
	param($Jira)
	Write-host "This is the incoming Jira:" $Jira
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Create Cert Test" -Description "Create Cert Test" -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function cert_guidelines_subtask {
	param($Jira)
	Write-host "This is the incoming Jira:" $Jira
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Documentation/Cert Guidelines" -Description ("h1. Cert Guidelines
	h2. Description
	[description]
	h2. Reference Materials
	[reference materials]
	h2. Prerequisites
	[prerequisites]
	h2. Testing Options
	Verify that [X works]
") -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function SBET_subtask {
	param($Jira)
	Write-host "This is the incoming Jira:" $Jira
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "MMF-SBET-Exploratory Test Case" -Description ("h1. Purpose
	The purpose of this charter is to validate that [] is functioning as expected.
	h1. Prerequisites
	[prereqs]
	h1. Testing and Acceptance Criteria
[expected results]

***NOTE:  A SESSION REPORT THAT INCLUDES THE TESTER'S ASSOCIATE ID, DATE, DOMAIN TESTED, WHAT SPECIFICALLY WAS TESTED AND ANY SUPPORTING EVIDENCE MUST BE COMPLETED FOR THIS CHARTER AND ATTACHED BELOW.***") -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function tech_doc_subtask {
	param($Jira)
	Write-host "This is the incoming Jira:" $Jira
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Update Tech Documentation" -Description "Update Technical Documentation" -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function txp_subtask {
	param($Jira)
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Create Transfer To Production Form" -Description "Create Transfer To Production Form" -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}
function excerttest_subtask {
	param($Jira)
	$task_key = New-JiraIssue -Project CAMMCRS -Issuetype "Sub-task" -Parent $Jira -Summary "Execute Cert Test" -Description "Execute Cert Test
	|Release Type|Version|Dev Testing|Cert Testing|
|Millennium base|2018.xx|ENG18, Solgm|S18BX, Intgm|
|Millennium bi-weekly (optional. Only used if previous versions need to be updated)|2018.05.xx|S18DD|S18XD|
|^|2018.06.xx|S18DF|S18XF|
|^|2018.07.xx|S18DA|S18XA|
|^|2018.08.xx|S18DB|S18XB|
|^|2018.09.xx|S18DC|S18XC|
|REST: WAS & Alva|NA|ENG18, Solgm|S18BX, Intgm|
|EJS|NA|ENG18, Solgm|S18BX, Intgm|
|Front end: Match List Management
 Multimedia Manager, dlls, etc.|NA|ENG18, Solgm|S18BX, Intgm|
|JAR|NA|Unit tests|NA|" -Reporter $username -Credential $cred
	$task_key = $task_key.key
	$task_key
}

function InstallJiraPS {
	# One time only install:
	Install-Module JiraPS -Scope CurrentUser
}

function UpdateJiraPS {
	# Check for updates occasionally:
	Update-Module JiraPS
}


#Get Credenditals
$username = Read-Host "Username"
$password = Read-Host "Password" -AsSecureString
$cred = New-Object System.Management.Automation.PSCredential ($username, $password)

# To use each session:
Import-Module JiraPS
Set-JiraConfigServer $jira2
New-JiraSession -Credential $cred
#}

# function CreateJira {
# 	Set-JiraConfigServer $jira2
	
# 		$summary = Read-Host "Summary"
# 		$description = Read-Host "Description"
# 		$solution = "CareAware MultiMedia"
# 		$solution_detail = "Shared Components"
# 		$jiragroup = "CAMM Core"
	
	
# 	"Solution detail: " + $solution_detail
	
# 	$parameters = @{
# 		Project     = "CAMMCRS"
# 		Issuetype   = "Story"
# 		Summary     = $summary
# 		Description = $description
# 		Reporter    = $username
# 		Credential  = $cred
# 		Fields      = @{
# 			customfield_14800 = @($solution)
# 			customfield_14801 = @($solution_detail)
# 			customfield_14802 = @($jiragroup)
# 			customfield_17607 = @{"self" = "https://jira2.cerner.com/rest/api/2/customFieldOption/19275"; "value" = "No"; "id" = "19275" }
# 		}
# 	}
# 	$str = $parameters | Out-String
# 	write-host $str
# 	$continue = Read-Host "Continue? (Y/N)"
# 	$continue = $continue.ToUpper()
# 	if ($continue -ne 'Y') { break }
# 	$newJira = New-JiraIssue @parameters
	
# 	$newJira = $newJira.Key
# 	"New Jira Key:" + $newJira
	
# 	# $substasks = Read-Host "Do you want to add Subtasks? (Y/N)`nAnswer"
# 	# $substasks = $substasks.ToUpper()
# 	# if ($substasks -eq "Y") {
# 	# 	CreateSubtasks -Jira $newJira -Flag 1
# 	# 	$substasks = ""
# 	# }
# }


function CreateSubtasks {
	param(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$Jira,
		$Flag
	)
	Switch ($Flag) {
		1 { [String[]]$Tasks = 'req', 'diw', 'ctp', 'scan', 'cg' }
		2 { [String[]]$Tasks = 'build', 'et', 'sbet', 'certtest', 'techdoc' }
		3 { [String[]]$Tasks = 'excerttest' }
	}


	Set-JiraConfigServer $jira2
	
	"Adding subtasks to:" + $Jira
	$assignee = get-jiraissue -key $Jira
	$assignee = $assignee.Assignee
	
	#From: https://atlassianps.org/docs/JiraPS/about/creating-issues.html
	#Create Jira Sub-Tasks
	if ($Tasks -match 'req') {
		$newJira = requirements_subtask 
		"Requirments Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($product_owner) 
	}
	if ($Tasks -match 'diw') {
		$newJira = design_implement_whitebox_subtask 
		"Design Implementation Whitebox Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($assignee) 
	}
	if ($Tasks -match 'scan') {
		$newJira = scan_subtask 
		"Scan Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($assignee) 
	}
	if ($Tasks -match 'ctp') {
		$newJira = create_test_plan_subtask 
		"Create Test Plan Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($product_owner) 
	}
	if ($Tasks -match 'build') {
		$newJira = build_subtask 
		"Build Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($assignee) 
	}
	if ($Tasks -match 'et') {
		$newJira = execute_test_subtask 
		"Execute Test Plan Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($assignee) 
	}
	if ($Tasks -match 'cg') {
		$newJira = cert_guidelines_subtask 
		"Cert Guidelines Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($product_owner) 
	}
	if ($Tasks -match 'sbet') {
		$newJira = SBET_subtask 
		"SBET Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($assignee) 
	}
	if ($Tasks -match 'certtest') {
		$newJira = create_certtest_subtask 
		"Create Cert Test Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($assignee) 
	}
	if ($Tasks -match 'techdoc') {
		$newJira = tech_doc_subtask 
		"Tech Documentation Test Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($assignee) 
	}
	if ($Tasks -match 'txp') {
		$newJira = txp_subtask 
		"Transfer to Production Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($assignee) 
	}
	if ($Tasks -match 'excerttest') {
		$newJira = excerttest_subtask 
		"Execute Certification Test Jira Key:" + $newJira
		Set-JiraIssue -Issue ($newJira) -Assignee ($assignee) 
	}
	'Done!'
}

function CreateSingleSubtask {
	Set-JiraConfigServer $jira2
	$more = "Y"
	$Jira = Read-Host 'Enter Jira Number. CAMMCRS-'
	# $Jira = $Jira.ToUpper()
	$Jira = "CAMMCRS-" + $Jira
	$assignee = get-jiraissue -key $Jira
	$assignee = $assignee.Assignee
	
	while ($more -eq 'Y') {
		$action = 0
		[int]$action = Read-Host $subtask_menu
		if ($action -eq 1) { requirements_subtask }
		if ($action -eq 2) { design_implement_whitebox_subtask }
		if ($action -eq 3) { scan_subtask }
		if ($action -eq 4) { create_test_plan_subtask }
		if ($action -eq 5) { build_subtask }
		if ($action -eq 6) { execute_test_subtask }
		if ($action -eq 7) { cert_guidelines_subtask }
		if ($action -eq 8) { SBET_subtask }
		if ($action -eq 9) { break }
		else { break }
		'Done' 
		$action = 0
		#}
		$more = Read-Host "More to add to this JIRA?"
		$more = $more.ToUpper()
	}	
	$more = 'N'
	$action = 0
	$Jira = ""
}


function ProcessJira {
	param(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$Jira
	)

	#Add Subtasks to first Jira
	# CreateSubtasks -Flag 1 -Jira $Jira

	#Option to add JForm
	$jform = Read-Host "Do you want to add a JForm? (Y/N)`nAnswer"
	$jform = $jform.ToUpper()
	if ($jform -eq "Y") {
		CreateJForm $Jira
		$jform = ""
	}
}

function CreateJForm {
	param(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$CorrespondingIssue
	)
	Set-JiraConfigServer $jira2
	$tempJira = get-jiraissue -key $CorrespondingIssue
	$summary = $tempJira.Summary
	$description = $tempJira.Description
	$solution_detail = $tempJira.customfield_14801
	
	$parameters = @{
		Project     = "JFORMS"
		Issuetype   = "Design Input Output"
		Summary     = $summary
		Description = $description
		Reporter    = $username
		Credential  = $cred
	
		Fields      = @{
			customfield_20337 = @("CareAware MultiMedia")
			customfield_20338 = @($solution_detail)
			customfield_20330 = @("CAMMCRS")
			customfield_20331 = "[JIRA:" + $CorrespondingIssue + "]"
		}
	}
	
	Set-JiraConfigServer $jira1
	$newJira = New-JiraIssue @parameters
	
	$newJira = $newJira.Key
	"New Jira Key:" + $newJira
}


function certguidelinesjira {
	Set-JiraConfigServer $jira1
	$originalsubtask = Read-Host 'Enter Cert Guidelines subtask JIRA ID. CAMMCRS-' 
	$originalsubtask = "CAMMCRS-" + $originalsubtask
	$summary = $originalsubtask + " Cert Guidelines"
	$description = $originalsubtask + " Cert Guidelines`nPlease see linked Jira subtask for the details"
	$parameters = @{
		Project     = "PRODOC"
		Issuetype   = "Documentation Enhancement"
		#IssueType = @{self="https://jira.cerner.com/rest/api/2/issuetype/11500";value="Documentation Enhancement";id=11500}
		Summary     = $summary
		Description = $description
		#Reporter = $username
		Credential  = $cred
		Fields      = @{
			components        = @(@{self = "https://jira.cerner.com/rest/api/2/customFieldOption/21068"; value = "Package Text"; id = "21068" })
			# customfield_10714 = "Next"
			customfield_16534 = (Read-Host "Solution Change #")
			duedate           = (read-host 'Enter Cert Guidelines Due Date (yyyy-mm-dd)')
		}
	}
	$str = $parameters | Out-String
	write-host $str
	# $continue = Read-Host "Continue to create Jira? (Y/N)"
	# $continue = $continue.ToUpper()
	DO { 
		$continue = Read-Host "Continue to create Jira? (Y/N)"
		$continue = $continue.ToUpper()
	} while ($continue -ne 'Y' -and $continue -ne 'N')
	if ($continue -eq 'Y') {
		$newJira = New-JiraIssue @parameters
		$newJira = $newJira.Key
		"New Jira Key:" + $newJira
		"Adding comment to PRODOC. To link the new Jira to the subtask it must be done in Jira directly."
		addCertGuidelinesLink -newJira $newJira -originalsubtask $originalsubtask
		"Adding comment to Subtask. To link the new Jira to the subtask it must be done in Jira directly."
		Set-JiraConfigServer $jira2
		$linkurl = 'https://jira.cerner.com/browse/' + $newJira
		$comment = '[' + $newJira + '|' + $linkurl + ']'
		Add-JiraIssueComment -Issue $originalsubtask -Comment $comment
		"Adding comment:" + $comment
	}
}

function addCertGuidelinesLink {
	param(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$newJira,
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$originalsubtask
	)
	#Set-JiraConfigServer $jira2
	#$originalsubtask = (get-jiraissue $originalsubtask)
	Set-JiraConfigServer $jira1
	#$newJira = (get-jiraissue $newJira)
	"Adding Link"
	#$_issueLink = [PSCustomObject]@{
	#	outwardIssue = [PSCustomObject]@{key = $originalsubtask}
	#	type = [PSCustomObject]@{name="Related";id = "10001"}
	#}
	#Add-JiraIssueLink -Issue $newJira -IssueLink $_issueLink
	
	$linkurl = 'https://jira2.cerner.com/browse/' + $originalsubtask
	$comment = '[' + $originalsubtask + '|' + $linkurl + ']'
	Add-JiraIssueComment -Issue $newJira -Comment $comment
	"Adding comment:" + $comment
}


#Set variables
$continue = 'Y'

#Main
while ($continue -eq 'Y') {
	#GetCreds
	$JiraIn = ""
	$action = 0
	$action = Read-Host $menu
	if ($action -eq 1) { InstallJiraPS }
	if ($action -eq 2) {
		$JiraIn = Read-Host 'Enter Jira Number. CAMMCRS-'
		# $JiraIn = $JiraIn.ToUpper()
		$JiraIn = "CAMMCRS-" + $JiraIn
		ProcessJira -Jira $JiraIn
 }
	if ($action -eq 3) {
		$JiraIn = Read-Host 'Enter Jira Number. CAMMCRS-'
		# $JiraIn = $JiraIn.ToUpper()
		$JiraIn = "CAMMCRS-" + $JiraIn
		cert_guidelines_subtask -Jira $JiraIn
 }
 if ($action -eq 4) {
	 $JiraIn = Read-Host 'Enter Jira Number. CAMMCRS-'
		#  $JiraIn = $JiraIn.ToUpper()
		$JiraIn = "CAMMCRS-" + $JiraIn
		write-host $JiraIn
	 CreateJForm -CorrespondingIssue $JiraIn
	}
	if ($action -eq 5) { certguidelinesjira }
	if ($action -eq "x") { break }
	else { $continue = 'Y' }
} 