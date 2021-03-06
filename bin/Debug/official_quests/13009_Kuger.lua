
-- [용병대장 쿠거]

-- EVENT 는 3000번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;

-- [용병대장 쿠거] 용병대장 쿠거 클릭 시 퀘스트 체크  

if EVENT == 3000 then
	QuestNum = SearchQuest(UID, 13009);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 1186, 13009, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 1187,13009)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 3001 then
    Ret = 1;
end

--시드 미셀 호출 

if EVENT == 3002 then
   SelectMsg(UID, 1, 11, 1188, 13009, 28, 3003, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 3003 then
   ShowMap(UID, 6);
   SaveEvent(UID, 3033);
end

if EVENT == 3004 then
   SelectMsg(UID, 1, 11, 1189, 13009, 10, 3003, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 쿠거 301번의 속성 0번 4번일 경우

if EVENT == 3005 then
   SelectMsg(UID, 2, 11, 1190, 13009, 10, 3006, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 3006 then
   SelectMsg(UID, 4, 11, 1191, 13009, 22, 3007, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 3007 then
   ZoneChange(UID, 51, 150, 150)
   SaveEvent(UID, 3034);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 3008 then
   SaveEvent(UID, 3036);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 11, 1192, 13009, 32, 3009, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 11, 1193, 13009, 21, 3009, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 3009 then
   ShowMap(UID, 6);
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 3010 then
   ITEM_COUNT = HowmuchItem(UID, 910038000);
   if  ITEM_COUNT <= 9 then -- 재료 없을때
      SelectMsg(UID, 2, 11, 1194, 13009, 18, 3011, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 9 then-- 재료 있을때
      SelectMsg(UID, 2, 11, 1195, 13009, 4006, 3012, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 3011 then
   ZoneChange(UID, 51, 150, 150)
end

local Check;

if EVENT == 3012 then
        Check = CheckExchange(UID, 304)
        if  Check ==1 then
        RunExchange(UID, 304);
        SaveEvent(UID, 3035);
        else
        Ret = 1;	
        end	 
end

--San-juck captian start
-----------------------------------------------------------
-- 산적 토벌대 시작 - 초급
-----------------------------------------------------------
local NPC = 13009;
local savenum = 600;
local savenum1 = 601;
local savenum2 = 602;
-----------------------------------------------------------

--시드 미셀 호출
if EVENT == 6000 then
   NATION = CheckNation(UID);
   SaveEvent(UID, 6002);
   if NATION == 1 then --카營� 占� 
   SelectMsg(UID, 1, savenum, 6000, NPC, 28, 6001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 占싹�
   SelectMsg(UID, 1, savenum, 6001, NPC, 28, 6001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6001 then
   ShowMap(UID,6);
end

------------------------------------------------------------------------
-- SANJUK Campaign Troops Start
------------------------------------------------------------------------

local Level = 0;
if EVENT == 6014 then
   Level = CheckLevel(UID);
   if Level >= 5 and Level <= 9 then
   	SelectMsg(UID, 2, savenum, 6002, NPC, 6005, 6002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else 
	SelectMsg(UID, 2, savenum, 1311, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6002 then
   SelectMsg(UID, 4, savenum, 6003, NPC, 22, 6003, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local WATING = 0;

if EVENT == 6003 then
   WATING = CheckWaiting(1);  -- 1:Begginer  2:Medium  3:Higher
   if WATING == 1 then
      SelectMsg(UID, 2, savenum, 6004, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      return;
   end
--   SaveEvent(UID, 6003);
   --카占싶� 占쏙옙占쏙옙占� 占쏙옙占쏙옙占� 
   SetCampaignGrade(UID, 1, 3, 9, 6004, "13009_Kuger.lua");  -- 1:Begginer  2:Medium  3:Higher, level limitation 3 ~ 9
   SelectMsg(UID, 8, savenum, 6005, NPC, 6003, 3001, 6004, 3001, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   -- 8 is Campaign Invitation Message...
end
   
if EVENT == 6004 then
   SetClearType(1, 81, 1, 1636, 20, 1001, 6008, UID, "13009_Kuger.lua");  -- complete condition setting 1:Boss Mob Eliminate, 12001: Mob ID
--   SetClearType(UID, 2, 30, 30, 101, 4010);  -- complete condition setting 2:Time Endure, 30:Endure time (minutes)
--   SetClearType(UID, 3, 128128, 20, 101, 4010); -- completecondition setting 3:Region Arrival 128128:position cordinate
end
--/*전체 UI 제거
if EVENT == 6005 then   -- A region passed  UID is contained zonenumber... broadcasting packets
   SelectMsg(UID, 6, 8101, 6006, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6006 then   -- B region passed
  SelectMsg(UID, 6, 8102, 6007, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6007 then   -- C region passed
   SelectMsg(UID, 6, 8103, 6008, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--전체 UI제거 */



--if EVENT == 6008 then   -- Quest Completed  WARNINIG!!! UID is contained zonenumber... broadcasting packets
--      GiveItem(UID, 910117000, 1);		
--     SaveEvent(UID, 6004);
--      SelectMsg(UID, 2, savenum1, 6012, NPC, 4006, 7200, 27, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1); 
--end

--local quest_ITEM_COUNT1=0;
local Check;
if EVENT == 6008 then
   GiveItem(UID, 910117000, 1);		
   Check = CheckExchange(UID, 86)
   if  Check ==1 then
   RunExchange(UID, 86);
   else
   Ret = 1;	
   end	 
   SaveEvent(UID, 6004);
end

------------------------------------------------------------------------
-- SANJUK Campaign Troops End
------------------------------------------------------------------------

---------占� 占쏙옙占�

local quest_ITEM_COUNT=0;
if EVENT == 6009 then
   quest_ITEM_COUNT = HowmuchItem(UID, 910117000);
if quest_ITEM_COUNT == 1 then
   NATION = CheckNation(UID);
   SaveEvent(UID, 6005);
   if NATION == 1 then --카營� 占� 
   SelectMsg(UID, 1, savenum1, 6009, NPC, 28, 6010, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 占싹�
   SelectMsg(UID, 1, savenum1, 6010, NPC, 28, 6010, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
  end
end

if EVENT == 6010 then
      ShowMap(UID, 53);
end

--1, 3
local ITEM_COUNT=0;
local RUN_EXCHANGE ;--占쏙옙체 占쏙옙占� 占쏙옙

if EVENT == 6011 then
   ITEM_COUNT = HowmuchItem(UID, 910117000);
   if  ITEM_COUNT <= 0 then -- 占쏙옙;
      SelectMsg(UID, 2, savenum1, 6011, NPC, 18, 6012, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 0 then-- 占쏙옙占�;
      --SaveEvent(UID, 6004);
      SelectMsg(UID, 2, savenum1, 6012, NPC, 4006, 6013, 27, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6012 then
--   SaveEvent(UID, 6002);
   ShowMap(UID, 53);
end

local Check;

if EVENT == 6013 then
        Check = CheckExchange(UID, 86)
        if  Check ==1 then
        RunExchange(UID, 86);
        else
        Ret = 1;	
        end	 
end

-----------------------------------------------------------
-- 산적 토벌대 끝 
-----------------------------------------------------------
--San-juck captian end

-------------------------------------------
---용기의 보석 시작 -----------------------
-------------------------------------------

if EVENT == 6060 then
   SelectMsg(UID, 1, 7, 6014, 13009, 28, 6061, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6061 then
   ShowMap(UID, 6);
   SaveEvent(UID, 6023);
end

if EVENT == 6062 then
   SelectMsg(UID, 1, 7, 6015, 13009, 10, 6061, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 쿠거 301번의 속성 0번 4번일 경우

if EVENT == 6063 then
   SelectMsg(UID, 2, 7, 6016, 13009, 10, 6064, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local Level ;

if EVENT == 6064 then
Level = CheckLevel(UID)
   if Level < 21 then 
   SelectMsg(UID, 4, 7, 6017, 13009, 22, 6065, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
   SelectMsg(UID, 2, 7, 6018, 13009, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end

end

if EVENT == 6065 then
   ZoneChange(UID, 52, 150, 150)
   SaveEvent(UID, 6024);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 6066 then
   SaveEvent(UID, 6026);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 7, 6019, 13009, 32, 6067, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 7, 6020, 13009, 21, 6067, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6067 then
   ShowMap(UID, 6);
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 6068 then
   ITEM_COUNT = HowmuchItem(UID, 910039000);
   if  ITEM_COUNT <= 9 then -- 재료 없을때
      SelectMsg(UID, 2, 7, 6021, 13009, 18, 6069, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 9 then-- 재료 있을때
      SelectMsg(UID, 2, 7, 6022, 13009, 4006, 6070, 27, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6069 then
   ZoneChange(UID, 52, 150, 150)
end

local Check;

if EVENT == 6070 then
        Check = CheckExchange(UID, 600)
        if  Check ==1 then
        RunExchange(UID, 600);
        SaveEvent(UID, 6025);
        else
        Ret = 1;	
        end	 
end
-------------------------------------------
---용기의 보석 끝 -----------------------
-------------------------------------------

-------------------------------------------
---배틀 필드 시작 -----------------------
-------------------------------------------

if EVENT == 6080 then
   SelectMsg(UID, 1, 602, 6030, 13009, 28, 6061, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6081 then
   ShowMap(UID, 6);
   SaveEvent(UID, 6033);
end

if EVENT == 6082 then
   SelectMsg(UID, 1, 602, 6031, 13009, 10, 6081, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 쿠거 301번의 속성 0번 4번일 경우

if EVENT == 6083 then
   SelectMsg(UID, 2, 602, 6032, 13009, 10, 6084, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local Level ;

if EVENT == 6084 then
Level = CheckLevel(UID)
   if Level > 1 and Level < 39 then -- 레벨이 40이하인가?   
   SelectMsg(UID, 2, 602, 6033, 13009, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if Level == 40 then -- 레벨이 40이상인가?   
   SelectMsg(UID, 2, 602, 6034, 13009, 59, 6085, 60, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);   
   end
   if Level > 40 then -- 레벨이 41이상인가?   
   SelectMsg(UID, 2, 602, 6035, 13009, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6085 then
   ZoneChange(UID, 53, 150, 150)
   SaveEvent(UID, 6034);
end

-- 레벨이 41이 되었을때 
local NATION = 0;--국가 체크
local Level = 0 ;
if EVENT == 6086 then
Level = CheckLevel(UID)
   if Level == 41 then
   SaveEvent(UID, 6035);
      NATION = CheckNation(UID);
      if NATION == 1 then -- 카루스 일때
         SelectMsg(UID, 1, 602, 6036, 13009, 61, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 엘모일때
         SelectMsg(UID, 1, 602, 6037, 13009, 62, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end

-------------------------------------------
---용기의 보석 끝 -----------------------
-------------------------------------------


--******************************************************--
-- 드래곤 사냥 시작 
--******************************************************--

local savenum = 444;

-- 시드미셀 등장

if EVENT == 630 then
   Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4377);
    EVENT = 631
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4382);
    EVENT = 631
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4387);
    EVENT = 631
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4392);
     EVENT = 631
   end
end

if EVENT == 631 then
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
    SelectMsg(UID, 1, savenum, 4635, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
    SelectMsg(UID, 1, savenum, 4636, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


-- 444 번의 속성 0번 4번일 경우

local MonsterSub = 0;

if EVENT == 632 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 4, savenum, 4637, NPC, 22, 633, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, savenum, 4638, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end



if EVENT == 633 then --수락시
   Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4378);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4383);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4388);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4393);
   end
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 280 then
   Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4380);
    EVENT = 281
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4385);
    EVENT = 281
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4390);
    EVENT = 281
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4395);
     EVENT = 281
   end
end

if EVENT == 281 then
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
    SelectMsg(UID, 1, savenum, 4639, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
    SelectMsg(UID, 1, savenum, 4640, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


-- 444의 1번 3번인 경우 

local MonsterCount01
local MonsterCount02
local MonsterCount03
local MonsterCount04


if EVENT == 636 then
   MonsterCount01  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount01  > 0 then -- 사냥이 완료 되었을때 
    Class = CheckClass (UID);
        if Class == 2 or Class == 7 or Class == 8 then
        SelectMsg(UID, 5, savenum, 4642, NPC, 4161, 637, 4162, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        else
        SelectMsg(UID, 4, savenum, 4642, NPC, 4161, 637, 4162, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else -- 사냥이 남았을때
    SelectMsg(UID, 2, savenum, 4641, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local Check;

if EVENT == 637 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 501)
        if  Check ==1 then        
        RunExchange(UID, 501);
        SaveEvent(UID, 4379);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 502)
        if  Check ==1 then        
        RunSelectExchange(UID, 502);
        SaveEvent(UID, 4384);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 503)
        if  Check ==1 then        
        RunExchange(UID, 503);
        SaveEvent(UID, 4389);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 504)
        if  Check ==1 then        
        RunExchange(UID, 504);
        SaveEvent(UID, 4394);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

--******************************************************--
-- 드래곤 사냥 끝
--******************************************************--


return Ret;