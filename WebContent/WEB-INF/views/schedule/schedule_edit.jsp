<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="/kronon/css/schedule_new.css">
<%@ include file="../layout/common/link.jsp" %>
<title>予定修正</title>
</head>
<body>

<%@ include file="../layout/common/header.jsp" %>

	<article>
			<form action="scheduleupdate" method="post" class="schedule-edit-form">
		<input type="hidden" id="flag" value="${popFlag}">
		<div class="schedule-regist-area">
		  <div class="loose-leaf"><img src="../img/loose_leaf.svg" alt="loose-leaf" id="loose-leaf"></div>
		   <div class="schedule-regist-area-inner">
			<div class="schedule-regist-font-lev0">予定修正</div>
			<input type="hidden" name="scheduleId" value="${scheduleBean.scheduleId}" id="set-schedule-id">
			<div class="schedule-regist-border"></div>
			<div class="schedule-regist-area-1">
				<div class="schedule-regist-area-1-block">
					<div class="schedule-regist-font-lev1">日付<span>*</span></div>
					<input type="hidden" value="${scheduleBean.scheduleDate}" id="set-date">
					<div class="schedule-regist-date-area"><input name="scheduleDate" id="date" type="date" value="${scheduleBean.scheduleDate}" /></div>
				</div>
				<div class="schedule-regist-area-1-block">
					<div class="schedule-regist-font-lev1">開始時刻<span>*</span></div>
					<div class="schedule-regist-time">
						<input type="hidden" value="${scheduleBean.startTime}" id="set-start-time">
						<select name="startTimeHour" id="edit-start-hour">
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
						</select>
					</div>

					<div class="schedule-regist-time-text">時</div>
					<div class="schedule-regist-time">
						<select name="startTimeMin" id="edit-start-minutes">
							<option value="00">00</option>
							<option value="15">15</option>
							<option value="30">30</option>
							<option value="45">45</option>
						</select>
					</div>
					<div class="schedule-regist-time-text">分</div>
				</div>

				<div class="schedule-regist-area-1-block">
					<div class="schedule-regist-font-lev1">終了時刻<span>*</span></div>
					<div class="schedule-regist-time">
					<input type="hidden" value="${scheduleBean.endTime}" id="set-end-time">
						<select name="endTimeHour" id="edit-end-hour">
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
						</select>
					</div>

					<div class="schedule-regist-time-text">時</div>
					<div class="schedule-regist-time">
						<select name="endTimeMin" id="edit-end-minutes">
							<option value="00">00</option>
							<option value="15">15</option>
							<option value="30">30</option>
							<option value="45">45</option>
						</select>
					</div>
					<div class="schedule-regist-time-text">分</div>
				</div>
			</div>


			<div class="schedule-regist-area-2">
				<div class="schedule-regist-font-lev1">場所<span>*</span></div>
				<div class="schedule-regist-place">

					<input type="hidden" value="${scheduleBean.place}" id="set-place">
						<select name="place" id="edit-place">
							<option value="0">オフィス</option>
							<option value="1">在宅</option>
							<option value="2">外出</option>
					</select>
				</div>
			</div>
			<div class="schedule-regist-area-3">
				<div class="schedule-regist-font-lev1">タイトル<span>*</span></div>
				<div class="schedule-regist-title">
					<textarea name="title" id="title" rows="1" cols="40" maxlength="100" placeholder="予定のタイトルを100字以内で入力してください"><c:out value="${scheduleBean.title}" /></textarea>
				</div>
			</div>

			<div class="schedule-regist-area-4">
				<div class="schedule-regist-font-lev1">内容</div>
				<div class="schedule-regist-content">
					<textarea name="content" id="content" rows="13" cols="40" maxlength="1440" placeholder="予定の内容を1440字以内で入力してください"><c:out value="${scheduleBean.content}" /></textarea>
				</div>
			</div>
		  </div>


		<div class="kronon-banzai"><img alt="banzai" src="/kronon/img/kronon/kronon_banzai.png"></div>

		<div class=schedule-regist-button>

		<!--修正ボタン---->

			<div class=schedule-regist-button-left>
			<input type="button" class="ok-button large-popup-button" id="ok-button" value="修正" >
			</div>

		<!--キャンセルボタン----->
			<div class=schedule-regist-button-right>
			<input type="button" class="ok-button cancel-button" id="cancel-button" value="キャンセル">
			</div>
	  	</div>
	  	<div class="clear"></div>
	  </div>
	</form>

	<!-- 戻るボタン -->
	<div class="cancel-button"><img src="/kronon/img/back_buttom.png" alt="back-buttom" class="back-btn"></div>
	<%-- <a href="scheduledetail?scheduleId=${scheduleBean.scheduleId}"> --%>

	  <!--エラーまたは完了ポップアップ------------------------------------------------------------------->
	  <div class="popup-wrapper error-popup">
	    <div class="pop-container">
	      <div class="close-popup"> <i class="fa fa-2x fa-times"></i> </div>
	      <div class="pop-container-inner">
	        <div class="message-container">
	          <p class=edit-msg></p>
	        </div>
	        <div class="ok-button close-popup">OK</div>
	        <img src="/kronon/img/kronon/kronon_komatta.png" class="pop-img"> </div>
	      </div>
	    </div>
	   <!--エラーまたは完了ポップアップここまで-------------------------------------------------------------->



			<!--本当に戻りますかポップアップ------------------------------------------------------------------->
		<div class="popup-wrapper cancel-popup" >
		  <div class="pop-container">
			<div class="close-popup"> <i class="fa fa-2x fa-times"></i> </div>
			<div class="pop-container-inner">
			  <div class="message-container">
				<p>内容は保存されないよ。</p>
				<h2 class="message-title">本当に戻る？</h2>
			  </div>
			  <a href="scheduledetail?scheduleId=${scheduleBean.scheduleId}"><div class="ok-button">OK</div></a>
			  <div class="ng-button close-popup">キャンセル</div>
			  <img src="/kronon/img/star/star_nomal.png" class="pop-img-top"> </div>
		  </div>
		</div>
		<!--本当に戻りますかポップアップここまで------------------------------------------------------------------->



		<!--内容確認ポップアップ----------------------------------------------------------------->
		<div class="popup-wrapper confirm-popup2" id="confirm-popup2">
		  <div class="pop-container pop-container-large">
			<div class="close-popup"> <i class="fa fa-2x fa-times"></i> </div>
			<div class="pop-container-inner">
			  <div class="message-container-large">
				<h2 class="message-title">この内容で更新するよ。</h2>
				<table class="popup-table">
				  <tr>
					<th class="th">名前：</th>
					<td><c:out value="${userName }" /></td>
				  </tr>
				  <tr>
					<th>予定日時：</th>
					<td id="time-msg"></td>
				  </tr>
				  <tr>
					<th>タイトル：</th>
					<td id="title-msg"></td>
				  </tr>
				  <tr>
					<th class="last-table">内容：</th>
					<td class="last-table" id="content-msg"></td>
				  </tr>
				</table>
			  </div>
			  <input type="button" class="ok-button"  id="confirm-ok" value="OK">
			  <div class="ng-button close-popup">キャンセル</div>
			  <img src="/kronon/img/star/star_nomal.png" class="pop-img"> </div>
		  </div>
		</div>
		<!--内容確認ポップアップここまで----------------------------------------------------------------->

		<!--登録完了ポップアップ------------------------------------------------------------------->
		<div class="popup-wrapper complete-popup">
			<div class="pop-container">
				<div class="close-popup"><i class="fa fa-2x fa-times"></i></div>
				<div class="pop-container-inner">
					<div class="message-container"><p class=create-msg></p></div>
					<div class="ok-button next-popup">OK</div>
					<img src="/kronon/img/star/star_nomal.png" class="pop-img">
				</div>
			</div>
		</div>
<!--登録完了ポップアップここまで-------------------------------------------------------------->

	</article>
<%@ include file="../layout/common/footer.jsp" %>
<script src="/kronon/js/schedule_edit.js"></script>
<script src="/kronon/js/common.js"></script>
</body>
</html>