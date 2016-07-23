# encoding: utf-8
module Students
  class API < Grape::API

    resource :students do
      desc 'Search for jobs (Deprecated: Use GET)'
      params do
        requires :id, type: Integer, desc: 'Student id'
      end
      get '/:id' do
        not_found!('Student not found') unless student = Student.find(params[:id])
        present student, with: Student::Entity
      end
    end
  end
end
