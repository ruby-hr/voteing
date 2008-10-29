class CandidatesController < ApplicationController
  layout 'home'
  
  
  def vote
    find_candidate
    @candidate.votes += 1
    @candidate.save
    redirect_to candidates_url
  end

  def unvote
    find_candidate
    @candidate.votes -= 1
    @candidate.save
    redirect_to candidates_url
  end

  # GET /candidates
  # GET /candidates.xml
  def index
    sort_string = "last_name asc"
    sort_order = 'asc'
    sort_order = 'desc' if params[:field] == 'votes'
    
    sort_string = "#{params[:field]} #{sort_order}" if params[:commit]
    
    @candidates = Candidate.find(:all, :order => sort_string)
    @vote_sum = Candidate.sum(:votes)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @candidates }
    end
  end

  # GET /candidates/1
  # GET /candidates/1.xml
  def show
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @candidate }
    end
  end

  # GET /candidates/new
  # GET /candidates/new.xml
  def new
    @candidate = Candidate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @candidate }
    end
  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  # POST /candidates.xml
  def create
    @candidate = Candidate.new(params[:candidate])

    respond_to do |format|
      if @candidate.save
        flash[:notice] = 'Candidate was successfully created.'
        format.html { redirect_to(@candidate) }
        format.xml  { render :xml => @candidate, :status => :created, :location => @candidate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /candidates/1
  # PUT /candidates/1.xml
  def update
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        flash[:notice] = 'Candidate was successfully updated.'
        format.html { redirect_to(@candidate) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.xml
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to(candidates_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def find_candidate
   @candidate = Candidate.find(params[:id])
  end
  
end
