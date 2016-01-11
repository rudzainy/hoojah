class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	belongs_to :role
  has_many :opinions
  has_many :comments
  has_many :debates
  has_many :hoojahs
  has_many :votes
  has_many :invitations

	before_save :assign_role
	before_save :generate_identicon

	def assign_role
		self.role = Role.find_by name: "Regular" if self.role.nil?
	end

	def generate_identicon
		self.avatar = Identicon.data_url_for self.email if self.avatar.nil?
	end

	def admin?
      self.role.name == "Admin"
  end

  def moderator?
  	self.role.name == "Moderator"
  end

  def regular?
  	self.role.name == "Regular"
  end
end
