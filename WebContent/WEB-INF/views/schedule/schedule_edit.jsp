<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="./css/schedule_edit.css">
<%@ include file="../layout/common/link.jsp" %>
<title>予定修正</title>
</head>
<body>

<%@ include file="../layout/common/header.jsp" %>

	<article>
			<form action="user/schedulecreate" method="post" class="schedule-edit-form">
		<input type="hidden" id="flag" value="${popFlag}">
		<div class="schedule-regist-area">
			<div class="schedule-regist-font-lev0">予定修正</div>
			<input type="hidden" value="${scheduleBean.scheduleId}" id="set-schedule-id">
			<div class="schedule-regist-border"></div>
			<div class="schedule-regist-area-1">
				<div class="schedule-regist-area-1-block">
					<div class="schedule-regist-font-lev1">日付<span>*</span></div>
					<!-- 本来はscheduleBean.date -->
					<input type="hidden" value="${date}" id="set-date">
					<div class="schedule-regist-date-area"><input name="date" id="edit-date" type="date" value="${date}" /></div>
				</div>
				<div class="schedule-regist-area-1-block">
					<div class="schedule-regist-font-lev1">開始時刻<span>*</span></div>
					<div class="schedule-regist-time">
					<!-- 本来はscheduleBean.startTime -->
						<input type="hidden" value="${startTime}" id="set-start-time">
						<select name="start-hour" id="edit-start-hour">
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
						<select name="start-minutes" id="edit-start-minutes">
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
					<!-- 本来はscheduleBean.endTime -->
					<input type="hidden" value="${endTime}" id="set-end-time">
						<select name="end-hour" id="edit-end-hour">
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
						<select name="end-minutes" id="edit-end-minutes">
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

				<!-- 本来はscheduleBean.place -->
					<input type="hidden" value="${place}" id="set-place">
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
				<!-- 本来はscheduleBean.title -->
					<textarea name="title" id="title" rows="1" cols="40" maxlength="100" placeholder="予定のタイトルを100字以内で入力してください"><c:out value="${title}" /></textarea>
				</div>
			</div>

			<div class="schedule-regist-area-4">
				<div class="schedule-regist-font-lev1">内容<span>*</span></div>
				<div class="schedule-regist-content">
				<!-- 本来はscheduleBean.content -->
					<textarea name="content" id="content" rows="13" cols="40" maxlength="1440" placeholder="予定の内容を1440字以内で入力してください"><c:out value="${content}" /></textarea>
				</div>
			</div>
		</div>

		<div class="kronon-banzai"><img alt="banzai" src="./img/kronon/kronon_banzai.png"></div>

		<div class=schedule-regist-button>

		<!--修正ボタン---->

			<div class=schedule-regist-button-left>
			<input type="button" class="ok-button large-popup-button" id="ok-button" value="修正" >
			</div>

		<!--キャンセルボタン----->
			<div class=schedule-regist-button-right>
			<input type="button" class="ok-button back-popup-button" id="cancel-button" value="キャンセル">
			</div>
		</div>
	</form>

  <!--エラーまたは完了ポップアップ------------------------------------------------------------------->
  <div class="popup-wrapper error-popup">
    <div class="pop-container">
      <div class="close-popup"> <i class="fa fa-2x fa-times"></i> </div>
      <div class="pop-container-inner">
        <div class="message-container">
          <p class=edit-msg></p>
        </div>
        <div class="ok-button close-popup">OK</div>
        <img src="img/kronon/kronon_question.png" class="pop-img"> </div>
      </div>
    </div>
   <!--エラーまたは完了ポップアップここまで-------------------------------------------------------------->



			<!--本当に戻りますかポップアップ------------------------------------------------------------------->
		<div class="popup-wrapper back-popup">
		  <div class="pop-container">
			<div class="close-popup"> <i class="fa fa-2x fa-times"></i> </div>
			<div class="pop-container-inner">
			  <div class="message-container">
				<p>内容は保存されないよ。</p>
				<h2 class="message-title">本当に戻る？</h2>
			  </div>
			  <a href="user/scheduledetail?id=${userId}"><div class="ok-button">OK</div></a>
			  <div class="ng-button close-popup">キャンセル</div>
			  <img src="../img/star_angry.png" class="pop-img-top"> </div>
		  </div>
		</div>
		<!--本当に戻りますかポップアップここまで------------------------------------------------------------------->



		<!--内容確認ポップアップ----------------------------------------------------------------->
		<div class="popup-wrapper confirm-popup">
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
			  <img src="../img/kronon_question.png" class="pop-img"> </div>
		  </div>
		</div>
		<!--内容確認ポップアップここまで----------------------------------------------------------------->

		<!--登録完了ポップアップ------------------------------------------------------------------->
		<div class="popup-wrapper error-popup complete-popup">
			<div class="pop-container">
				<div class="close-popup"><i class="fa fa-2x fa-times"></i></div>
				<div class="pop-container-inner">
					<div class="message-container"><p class=create-msg></p></div>
					<div class="ok-button next-popup">OK</div>
					<img src="/kronon/img/kronon/kronon_question.png" class="pop-img">
				</div>
			</div>
		</div>
<!--登録完了ポップアップここまで-------------------------------------------------------------->


	</article>
<%@ include file="../layout/common/footer.jsp" %>
<script src="js/schedule_edit.js"></script>
<!-- <script src="js/common.js"></script> -->
</body>
</html>