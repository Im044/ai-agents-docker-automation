#!/bin/bash

# AI Agents Docker Automation - Automated Setup Script
# This script sets up the complete Docker environment for all AI agents
# Beginner-friendly with step-by-step instructions

set -e  # Exit on any error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions for colored output
print_header() {
    echo -e "${BLUE}=====================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}=====================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# Check if Docker is installed
check_docker() {
    print_header "Checking Docker Installation"
    
    if ! command -v docker &> /dev/null; then
        print_error "Docker is not installed"
        print_info "Please install Docker from: https://docs.docker.com/get-docker/"
        exit 1
    fi
    
    print_success "Docker is installed: $(docker --version)"
}

# Check if Docker Compose is installed
check_docker_compose() {
    print_header "Checking Docker Compose Installation"
    
    if ! command -v docker-compose &> /dev/null; then
        print_error "Docker Compose is not installed"
        print_info "Please install Docker Compose from: https://docs.docker.com/compose/install/"
        exit 1
    fi
    
    print_success "Docker Compose is installed: $(docker-compose --version)"
}

# Create necessary directories
setup_directories() {
    print_header "Setting Up Directories"
    
    mkdir -p agents/content-creator
    mkdir -p agents/data-analyst
    mkdir -p agents/research
    mkdir -p agents/code-assistant
    mkdir -p agents/sales-marketing
    mkdir -p logs
    mkdir -p data
    
    print_success "All directories created"
}

# Copy environment file if not exists
setup_env_file() {
    print_header "Setting Up Environment File"
    
    if [ ! -f .env ]; then
        if [ -f .env.example ]; then
            cp .env.example .env
            print_success "Environment file created from template"
        else
            print_error ".env.example not found"
            exit 1
        fi
    else
        print_info ".env file already exists"
    fi
}

# Validate docker-compose.yml
validate_compose() {
    print_header "Validating Docker Compose Configuration"
    
    if docker-compose config > /dev/null 2>&1; then
        print_success "docker-compose.yml is valid"
    else
        print_error "docker-compose.yml has errors"
        exit 1
    fi
}

# Build Docker images
build_images() {
    print_header "Building Docker Images"
    
    print_info "This may take a few minutes..."
    
    if docker-compose build; then
        print_success "All Docker images built successfully"
    else
        print_error "Failed to build Docker images"
        exit 1
    fi
}

# Start services
start_services() {
    print_header "Starting AI Agent Services"
    
    if docker-compose up -d; then
        print_success "All services started successfully"
        print_info "Services are running in background mode"
    else
        print_error "Failed to start services"
        exit 1
    fi
}

# Display service status
show_status() {
    print_header "Service Status"
    
    docker-compose ps
    
    print_info "All AI agents are now running in Docker containers"
}

# Show next steps
show_next_steps() {
    print_header "Next Steps"
    
    echo ""
    echo "Useful commands:"
    echo -e "  ${YELLOW}View logs:${NC}          docker-compose logs -f [service-name]"
    echo -e "  ${YELLOW}Stop services:${NC}       docker-compose down"
    echo -e "  ${YELLOW}Restart service:${NC}     docker-compose restart [service-name]"
    echo -e "  ${YELLOW}Run command in container:${NC} docker-compose exec [service-name] bash"
    echo ""
    echo "For more information, check GETTING_STARTED.md"
    echo ""
}

# Main execution
main() {
    print_header "AI Agents Docker Automation Setup"
    print_info "Starting automated setup process..."
    echo ""
    
    check_docker
    echo ""
    
    check_docker_compose
    echo ""
    
    setup_directories
    echo ""
    
    setup_env_file
    echo ""
    
    validate_compose
    echo ""
    
    build_images
    echo ""
    
    start_services
    echo ""
    
    show_status
    echo ""
    
    show_next_steps
    echo ""
    
    print_success "Setup completed successfully!"
    print_info "All AI agents are ready to use. Enjoy!"
}

# Run main function
main
