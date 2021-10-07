(defun jump-to-percentage-position (x y)
  "Jump to the x% and y% offsets.
   x, y are values between 0 and 1"
  (interactive)

)

;; TODO: change this to a map
(defun convert-percentage-to-absolute-pixel-position (x y)
  (let ((screen-info (screen-width-height)))
    (cons (* x (car screen-info)) (* y (cdr screen-info)))))

(defun screen-width-height () ;; -> (w, h) in pixels
  (cons (window--size-to-pixel nil (window-total-width)) (window--size-to-pixel nil (window-total-height)))
)

;;;;;;;;;;;;;;;; test cases
(message "%s" (convert-percentage-to-absolute-pixel-position 0.5 0.5))

;;;;;;;;;;;;;;;; misc notes

;; try using mapcar as it applies a function to every element in the list
;; (mapcar (lambda (X) <SHELL-COMMAND-TO-STRING on X>)
;;        (split-string (buffer-substring-no-properties BEG END) "\n"))

;; (window-absolute-pixel-position) gets the current point pos relative to WINDOW's display. it also seems to work across frames.

;; From https://emacs.stackexchange.com/questions/30852/how-can-i-move-point-to-where-the-mouse-is-pointing-now
;; (defun jump-to-cursor ()
;;   "Jump to the position under the mouse cursor if possible."
;;   (interactive)
;;   (when-let ((cursor-pos (mouse-position))
;;          (line (cddr cursor-pos))
;;          (col  (cadr cursor-pos))
;;          (p (save-excursion
;;           (goto-char (window-start))
;;           (forward-line line)
;;           (if (> (- (line-end-position) (line-beginning-position)) col)
;;               (progn  (move-to-column col) (1- (point)))
;;             nil))))
;;     (goto-char p)))

;; (let ((position (window-absolute-pixel-position)))
;;  (set-mouse-absolute-pixel-position
;;   (car position) (cdr position)))
