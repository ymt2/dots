;;; 40_twittering_mode.el --- 

;;; (auto-install-from-url "https://raw.github.com/hayamiz/twittering-mode/master/twittering-mode.el")

(require 'twittering-mode)
(add-hook 'twittering-mode-hook
	  (lambda ()
	    (let ((alist (pit/get 'twitter.com
				  '(require ((user . "Your twitter user name")
					     (password . "Your twitter password"))))))
	      (setq twittering-username (cdr (assoc 'user alist)))
	      (setq twittering-password (cdr (assoc 'password alist))))
	    (setq twittering-auth-method 'xauth)
	    (setq twittering-timer-interval 75)
	    (setq twittering-number-of-tweets-on-retrieval 50)
	    (setq twittering-icon-mode t)
	    (setq twittering-status-format "%i @%s %S %p: \n %T \n [%@]%r %R %f \n ------------------------------------")))
