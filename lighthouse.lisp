;;; lighthouse.lisp --- LighthouseLogic Management Interface

;; Copyright (C) 2014 Jaime Fournier <jaimef@linbsd.org>

;; Author: Jaime Fournier <jaimef@linbsd.org>
;; Keywords: Lighthouse Management Interface
;; Version: 0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Work in progress

;;; Code:


(ql:quickload :yason)
(ql:quickload :drakma)
(defpackage :lighthouse (:use :cl :drakma :yason))
(in-package :lighthouse)

(defvar *lighthouse-headers* (list (cons "X-LighthouseToken" *lighthouse-token*)))


(defun lighthouse-get-tickets (url)
  (lighthouse-process-tickets
   (let
       ((stream
	 (drakma:http-request url :want-stream t :additional-headers *lighthouse-headers*)))
     (setf (flexi-streams:flexi-stream-external-format stream) :utf-8)
     (yason:parse stream ))))

(defun lighthouse-process-tickets (tickets)
  (loop for entry in (gethash "tickets" foo)
     do
       (let* ((ticket (gethash "ticket" entry))
	      (state_color (gethash "state_color" ticket))
	      (original_body_html (gethash "original_body_html" ticket))
	      (latest_body (gethash "latest_body" ticket))
	      (original_body (gethash "original_body" ticket))
	      (importance_name (gethash "importance_name" ticket))
	      (priority (gethash "priority" ticket))
	      (milestone_tilte (gethash "milestone_title" ticket))
	      (url (gethash "url" ticket))
	      (assigned_user_name (gethash "assigned_user_name" ticket))
	      (creator_name (gethash "creator_name" ticket))
	      (user_name (gethash "user_name" ticket))
	      (watcher_ids (gethash "watcher_ids" ticket))
	      (version (gethash "version" ticket))
	      (user_id (gethash "user_id" ticket))
	      (updated_at (gethash "updated_at" ticket))
	      (title (gethash "title" ticket))
	      (tag (gethash "tag" ticket))
	      (state (gethash "state" ticket))
	      (spam (gethash "spam" ticket))
	      (raw_data (gethash "raw_data" ticket))
	      (project_id (gethash "project_id" ticket))
	      (permalink (gethash "permalink" ticket))
	      (number (gethash "number" ticket))
	      (milestone_order (gethash "milestone_order" ticket))
	      (milestone_id (gethash "milestone_id" ticket))
	      (milestone_due_on (gethash "milestone_due_on" ticket))
	      (importance (gethash "importance" ticket))
	      (creator_id (gethash "creator_id" ticket))
	      (created_at (gethash "created_at" ticket))
	      (closed (gethash "closed" ticket))
	      (attachments_count (gethash "attachments_count" ticket))
	      (assigned_user_id (gethash "assigned_user_id" ticket)))
	 (if url
	     (print (format nil "Owner:~a url:~a number:~a" assigned_user_name url number))))))


;;(lighthouse-get-tickets "http://127.0.0.1:8080/lighthouse/")
;;(lighthouse-get-tickets *lighthouse-url*)
