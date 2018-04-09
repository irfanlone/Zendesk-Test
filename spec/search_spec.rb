require_relative "../search.rb"

RSpec.describe Search do
  let(:search_app) { Search.new }
  let(:search_type) { nil }
  let(:search_term) { "" }
  let(:search_value) { "" }

  describe "#run" do
    subject { search_app.run(search_type, search_term, search_value) }

    context "when searching for user" do
      let(:search_type) { :user }
      let(:search_term) { "name" }
      let(:search_value) { "Rose Newton" }
      let(:result) { [] }

      before do
        allow(User).to receive(:where).and_return(result)
      end

      context "when users matches the search" do
        let(:result) { [User.new(name: search_value)] }

        it "returns 1 user" do
          expect(subject.size).to eq(1)
        end

        it "returns correct user" do
          expect(subject.first.name).to eq(search_value)
        end
      end

      context "when there is no matching user" do
        let(:search_value) { "irfan lone" }
        let(:result) { [] }

        it "returns nothing" do
          expect(subject).to eq(result)
        end
      end

      context "when the term is not searchable or invalid" do
        let(:search_term) { "namescope" }
        it "returns nil" do
          expect(subject).to eq(nil)
        end
      end
    end

    context "when searching for Tickets" do
      let(:search_type) { :ticket }
      let(:search_term) { "type" }
      let(:search_value) { "incident" }
      let(:result) { [] }

      before do
        allow(Ticket).to receive(:where).and_return(result)
      end

      context "when search return matches" do
        let(:result) { [Ticket.new(type: search_value)] }

        it "returns 1 Ticket" do
          expect(subject.size).to eq(1)
        end

        it "returns correct Ticket" do
          expect(subject.first.type).to eq(search_value)
        end
      end

      context "when there is no matching Ticket" do
        let(:search_value) { "something type" }
        let(:result) { [] }

        it "returns nothing" do
          expect(subject).to eq(result)
        end
      end

      context "when the term is not searchable or invalid" do
        let(:search_term) { "ognnamescope" }

        it "returns nil" do
          expect(subject).to eq(nil)
        end
      end
    end

    context "when searching for Organizations" do
      let(:search_type) { :organization }
      let(:search_term) { "name" }
      let(:search_value) { "Koffee" }
      let(:result) { [] }

      before do
        allow(Organization).to receive(:where).and_return(result)
      end

      context "when search return matches" do
        let(:result) { [Organization.new(name: search_value)] }

        it "returns 1 Organization" do
          expect(subject.size).to eq(1)
        end

        it "returns correct Organization" do
          expect(subject.first.name).to eq(search_value)
        end
      end

      context "when there is no matching Organization" do
        let(:search_value) { "rodeside tech" }
        let(:result) { [] }

        it "returns nothing" do
          expect(subject).to eq(result)
        end
      end

      context "when the term is not searchable or invalid" do
        let(:search_term) { "ognnamescope" }

        it "returns nil" do
          expect(subject).to eq(nil)
        end
      end
    end
  end
end
