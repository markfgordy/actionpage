class CreateUserController < UIViewController
	def viewDidLoad
		super

		self.title = "Create User"
		self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed("background2"))

		@button = UIButton.buttonWithType(UIButtonTypeCustom)
	    @button.setImage(UIImage.imageNamed('button'), forState:UIControlStateNormal)
	    @button.setImage(UIImage.imageNamed('button3'), forState:UIControlStateHighlighted)
		@button.frame = [CGPointZero, [260, 50]]
		@button.center = 
			[self.view.frame.size.width / 2, self.view.frame.size.height / 1 - 80]
		self.view.addSubview(@button)

		@button.addTarget(self,
			action: "action",
			forControlEvents:UIControlEventTouchUpInside)

		loadButtons
	end

	def action
		sheet = UIActionSheet.alloc.initWithTitle("Add Photo",
		  delegate:self,
		  cancelButtonTitle:'cancel',
		  destructiveButtonTitle:nil,
		  otherButtonTitles:"Open Gallery", "Take A Picture", nil)
		sheet.showInView(view)
	end

	def actionSheet(sheet, didDismissWithButtonIndex:buttonIndex)
	  if (buttonIndex) == 0
	  	open_gallery
	  elsif (buttonIndex) == 1
	  	start_camera
	  end
	end

	def loadButtons
		@image_picker = UIImagePickerController.alloc.init
    	@image_picker.delegate = self
    end

  	def imagePickerController(picker, didFinishPickingImage:image, editingInfo:info)
	    self.dismissModalViewControllerAnimated(true)
	    @image_view.removeFromSuperview if @image_view
	    @image_view = UIImageView.alloc.initWithImage(image)
	    @image_view.frame = [[100, 50], [320, 480]]
	    view.addSubview(@image_view)
  	end

  	def imagePickerController(picker, didFinishPickingMediaWithInfo:edit)
  		self.dismissModalViewControllerAnimated(true)
  		@pic = UIImagePickerControllerEditedImage
  		@edit_pic = UIImageView.alloc.initWithImage(edit)[@pic]
  	end
  
	def start_camera
	if camera_present
	  @image_picker.sourceType = UIImagePickerControllerSourceTypeCamera
	  presentModalViewController(@image_picker, animated:true)
	else
	  show_alert
	end
	end

	def open_gallery
	@image_picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary
	presentModalViewController(@image_picker, animated:true)
	end

	def show_alert
	@alert_box = UIAlertView.alloc.initWithTitle("Error",
	  message: "Sorry, Chekingo cannot use your Camera. Please select a picture from your Carmera Roll",
	  delegate: nil,
	  cancelButtonTitle: "Okay",
	  otherButtonTitles: nil)
	@alert_box.show
	end

	#Check Camera available or not
	def camera_present
	UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceTypeCamera)
	end
 
end